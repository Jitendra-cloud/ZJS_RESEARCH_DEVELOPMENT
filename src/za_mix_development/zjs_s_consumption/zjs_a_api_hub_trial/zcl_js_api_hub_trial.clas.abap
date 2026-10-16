CLASS zcl_js_api_hub_trial DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_js_api_hub_trial IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lv_url         TYPE string,
          lo_http_client TYPE REF TO if_web_http_client,
          emailid        TYPE string.

    TYPES: BEGIN OF ty_metadata,
             id   TYPE string,
             uri  TYPE string,
             type TYPE string,
           END OF ty_metadata,

           BEGIN OF ty_address_email,
             __metadata                     TYPE ty_metadata,
             addressid                      TYPE string,
             person                         TYPE string,
             ordinalnumber                  TYPE string,
             isdefaultemailaddress          TYPE string,
             emailaddress                   TYPE string,
             searchemailaddress             TYPE string,
             addresscommunicationremarktext TYPE string,
           END OF ty_address_email,

*           BEGIN OF ty_root,
*             __count TYPE string,
*             results TYPE STANDARD TABLE OF ty_address_email WITH EMPTY KEY,
*           END OF ty_root,
*           BEGIN OF ty_root1,
*             d TYPE ty_root,
*           END OF ty_root1.

*    DATA : lv_root TYPE ty_root1.

           BEGIN OF ty_root,
             d TYPE ty_address_email,
           END OF ty_root.

    DATA : lv_root TYPE ty_root.



    lv_url = |https://sandbox.api.sap.com/s4hanacloud/sap/opu/odata/sap/API_BUSINESS_PARTNER/| &&
             |A_AddressEmailAddress(AddressID='22820',| &&
             |Person='22828',| &&
             |OrdinalNumber='2')|.

    TRY.
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( i_url = lv_url ) ).

        DATA(lo_request) = lo_http_client->get_http_request( ).

        lo_request->set_header_fields( VALUE #( ( name = 'Accept' value = 'application/json')
                                                ( name = 'APIKey' value = '7vj3TYP8L1N4SQZARayObkKSeidq520p' ) ) ).


        DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).
        DATA(lv_status) = lo_response->get_status( ).

        DATA(lv_response) = lo_response->get_text( ).

        out->write( |HTTP Status: { lv_status-code }| ).
        out->write( |Reason: { lv_status-reason }| ).

        IF lv_status-code = 200.

          /ui2/cl_json=>deserialize( EXPORTING json = lv_response
                                     CHANGING data = lv_root ).

          emailid = lv_root-d-emailaddress.
          out->write( |Email ID: { emailid }| ).

        ELSE.

          out->write( 'API call failed:' ).
          out->write( lv_response ).

        ENDIF.

      CATCH cx_web_http_client_error
        cx_web_message_error
        cx_http_dest_provider_error
        INTO DATA(lx_error).

        out->write( lx_error->get_text( ) ).

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
