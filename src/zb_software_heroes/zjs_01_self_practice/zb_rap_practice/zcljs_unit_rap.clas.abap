"! @testing ZCJS_I_RAPPartner
CLASS zcljs_unit_rap DEFINITION PUBLIC FINAL CREATE PUBLIC
    FOR TESTING
    DURATION SHORT
    RISK LEVEL HARMLESS.

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      create_new_entry    FOR TESTING,
      fill_empty_streets  FOR TESTING,
      clear_empty_streets FOR TESTING.
ENDCLASS.



CLASS ZCLJS_UNIT_RAP IMPLEMENTATION.


  METHOD clear_empty_streets.
      DATA:
      lt_clear_streets TYPE TABLE FOR ACTION IMPORT ZCJS_I_RAPPartner~clearAllEmptyStreets.
    INSERT INITIAL LINE INTO TABLE lt_clear_streets.
    MODIFY ENTITIES OF ZCJS_I_RAPPartner
      ENTITY Partner EXECUTE clearAllEmptyStreets FROM lt_clear_streets
      MAPPED DATA(ls_mapped)
      FAILED DATA(ls_failed)
      REPORTED DATA(ls_reported).

    COMMIT ENTITIES
      RESPONSE OF ZCJS_I_RAPPartner     REPORTED DATA(ls_commit_reported)
                                        FAILED DATA(ls_commit_failed).
    SELECT FROM zdjs_partner FIELDS partner WHERE street = 'EMPTY' INTO TABLE @DATA(lt_empty_streets).
    cl_abap_unit_assert=>assert_subrc( exp = 4 ).
  ENDMETHOD.


  METHOD create_new_entry.
    DATA:
    lt_new_partner TYPE TABLE FOR CREATE ZCJS_I_RAPPartner.
    lt_new_partner = VALUE #( ( partnername = 'Google'
                                street = 'Waterloo Street 13'
                                city = 'London'
                                country = 'GB'
                                paymentcurrency = 'GBP'
                                %control-PartnerName = if_abap_behv=>mk-on
                                %control-Street = if_abap_behv=>mk-on
                                %control-City = if_abap_behv=>mk-on
                                %control-Country = if_abap_behv=>mk-on
                                %control-PaymentCurrency = if_abap_behv=>mk-on ) ).
    MODIFY ENTITIES OF ZCJS_I_RAPPartner
      ENTITY Partner CREATE FROM lt_new_partner
      MAPPED DATA(ls_mapped).
    COMMIT ENTITIES

      RESPONSE OF ZCJS_I_RAPPartner REPORTED DATA(ls_commit_reported)
                                    FAILED DATA(ls_commit_failed).
    cl_abap_unit_assert=>assert_initial( ls_commit_reported-partner ).
    cl_abap_unit_assert=>assert_initial( ls_commit_failed-partner ).

    SELECT SINGLE FROM zdjs_partner FIELDS partner, name WHERE name = 'Google' INTO @DATA(ls_partner_found).
    cl_abap_unit_assert=>assert_subrc( ).
  ENDMETHOD.


  METHOD fill_empty_streets.
      DATA:
      lt_fill_streets TYPE TABLE FOR ACTION IMPORT ZCJS_I_RAPPartner~fillEmptyStreets.
      lt_fill_streets = VALUE #( ( PartnerNumber = '2000000001' ) ).

    MODIFY ENTITIES OF ZCJS_I_RAPPartner ENTITY Partner EXECUTE fillEmptyStreets FROM lt_fill_streets     MAPPED DATA(ls_mapped)
                                                                                                          FAILED DATA(ls_failed)
                                                                                                          REPORTED DATA(ls_reported).
    COMMIT ENTITIES
      RESPONSE OF ZCJS_I_RAPPartner REPORTED DATA(ls_commit_reported)
                                    FAILED DATA(ls_commit_failed).

    SELECT SINGLE FROM zdjs_partner FIELDS partner, Street WHERE partner = '2000000001' INTO @DATA(ls_partner_found).

    cl_abap_unit_assert=>assert_subrc( ).
    cl_abap_unit_assert=>assert_equals( act = ls_partner_found-street exp = 'EMPTY' ).
  ENDMETHOD.
ENDCLASS.
