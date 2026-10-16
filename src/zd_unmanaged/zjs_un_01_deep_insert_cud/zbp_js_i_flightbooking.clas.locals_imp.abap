CLASS lhc_ZJS_I_FlightBooking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZJS_I_FlightBooking RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZJS_I_FlightBooking RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ZJS_I_FlightBooking.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZJS_I_FlightBooking.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZJS_I_FlightBooking.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZJS_I_FlightBooking RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ZJS_I_FlightBooking.

    METHODS rba_Passengers FOR READ
      IMPORTING keys_rba FOR READ ZJS_I_FlightBooking\_Passengers FULL result_requested RESULT result LINK association_links.

    METHODS cba_Passengers FOR MODIFY
      IMPORTING entities_cba FOR CREATE ZJS_I_FlightBooking\_Passengers.

    METHODS ConfirmTicket FOR MODIFY
      IMPORTING keys FOR ACTION ZJS_I_FlightBooking~ConfirmTicket RESULT result.

ENDCLASS.

CLASS lhc_ZJS_I_FlightBooking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.

    LOOP AT entities INTO DATA(ls_booking).

      " Build header work-area matching DB table structure and insert
      DATA(ls_hdr) = VALUE zdjs_booking_hdr(
        booking_id   = ls_booking-booking_id
        customer_id  = ls_booking-customer_id
        flight_no    = ls_booking-flight_no
        booking_date = ls_booking-booking_date
        status       = ls_booking-status ).

      INSERT zdjs_booking_hdr FROM @ls_hdr.
      IF sy-subrc <> 0.
        " handle failure (optional)
        CONTINUE.
      ENDIF.

    ENDLOOP.


  ENDMETHOD.

  METHOD update.

    LOOP AT entities INTO DATA(ls_entity).

      " Update booking header fields
      UPDATE zdjs_booking_hdr
       SET customer_id  = @ls_entity-customer_id,
           flight_no    = @ls_entity-flight_no,
           booking_date = @ls_entity-booking_date,
           status       = @ls_entity-status
     WHERE
       booking_id   = @ls_entity-booking_id.

    ENDLOOP.


  ENDMETHOD.

  METHOD delete.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<ls_key>).

      " Delete from DB table
      DELETE FROM zdjs_booking_hdr
        WHERE booking_id = @<ls_key>-booking_id.

      IF sy-subrc <> 0.
        " Raise RAP message if record not found
        APPEND VALUE #( %msg = new_message(
                          id       = 'ZBOOKING_MSG'
                          number   = '001'
                          severity = if_abap_behv_message=>severity-error
                          v1       = <ls_key>-booking_id ) ) TO reported-zjs_i_flightbooking.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD read.

    LOOP AT keys INTO DATA(ls_key).

      "Fetch header record
      SELECT SINGLE mandt,
                    booking_id,
                    customer_id,
                    flight_no,
                    booking_date,
                    status
        FROM zdjs_booking_hdr
        WHERE booking_id = @ls_key-booking_id
        INTO @DATA(ls_hdr).

      IF sy-subrc = 0.
        APPEND VALUE #( %tky      = ls_key-%tky
*                      mandt     = ls_hdr-mandt
                        booking_id = ls_hdr-booking_id
                        customer_id = ls_hdr-customer_id
                        flight_no   = ls_hdr-flight_no
                        booking_date = ls_hdr-booking_date
                        status     = ls_hdr-status ) TO result.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Passengers.

    DATA lt_pass TYPE STANDARD TABLE OF zdjs_book_pass.

    " Read passengers for the given booking IDs
    SELECT * FROM zdjs_book_pass
      FOR ALL ENTRIES IN @keys_rba
      WHERE booking_id = @keys_rba-booking_id
      INTO TABLE @lt_pass.

    " Map DB results to RAP result
    result = CORRESPONDING #( lt_pass ).

  ENDMETHOD.

  METHOD cba_Passengers.

    LOOP AT entities_cba INTO DATA(ls_entity).
      LOOP AT ls_entity-%target INTO DATA(ls_pass).
        " Generate new passenger number (simple approach)
        DATA(lv_new_pass_no) = sy-tabix. " Better: use number range or UUID


        DATA(ls_booking) =  VALUE zdjs_book_pass(
         booking_id     = ls_pass-booking_id
         passenger_no   = lv_new_pass_no
         name           = ls_pass-name
         seat_no        = ls_pass-seat_no
         ticket_status  = ls_pass-ticket_status
       ).

        INSERT zdjs_book_pass FROM @ls_booking.
        IF sy-subrc <> 0.
          " handle failure (optional)
          CONTINUE.
        ENDIF.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

  METHOD ConfirmTicket.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<ls_key>).

      " 1. Update booking header
      UPDATE zdjs_booking_hdr
        SET status = 'B'
        WHERE booking_id = @<ls_key>-booking_id.

      " 2. Update dependent passengers
      UPDATE zdjs_book_pass
        SET ticket_status = 'B'
        WHERE booking_id = @<ls_key>-booking_id.

      " 3. Return updated header so UI refreshes
      APPEND VALUE #( booking_id = <ls_key>-booking_id ) TO result.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZJS_I_BookingPassenger DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ZJS_I_BookingPassenger.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ZJS_I_BookingPassenger.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ZJS_I_BookingPassenger.

    METHODS read FOR READ
      IMPORTING keys FOR READ ZJS_I_BookingPassenger RESULT result.

    METHODS rba_Flightbooking FOR READ
      IMPORTING keys_rba FOR READ ZJS_I_BookingPassenger\_Flightbooking FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZJS_I_BookingPassenger IMPLEMENTATION.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Flightbooking.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZJS_I_FLIGHTBOOKING DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZJS_I_FLIGHTBOOKING IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
