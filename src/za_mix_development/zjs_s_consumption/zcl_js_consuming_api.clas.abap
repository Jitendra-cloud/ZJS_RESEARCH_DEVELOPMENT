CLASS zcl_js_consuming_api DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_js_consuming_api IMPLEMENTATION.

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

           BEGIN OF ty_root,
             d TYPE ty_address_email,
           END OF ty_root.

    DATA : lv_root TYPE ty_root.



    lv_url = |https://s4h2023.sapdemo.com:44303/sap/opu/odata/sap/API_BUSINESS_PARTNER/| &&
             |A_BusinessPartner?$top=5&$format=json|.

*    lv_url = |https://124.123.22.43:44303/sap/opu/odata/sap/API_BUSINESS_PARTNER/| &&
*             |A_BusinessPartner?$top=5&$format=json|.

    TRY.
        lo_http_client = cl_web_http_client_manager=>create_by_http_destination( i_destination = cl_http_destination_provider=>create_by_url( i_url = lv_url ) ).

        DATA(lo_request) = lo_http_client->get_http_request( ).

        lo_request->set_authorization_basic( EXPORTING i_username = 'S23A31' i_password = 'hana@1234'
                                             RECEIVING r_value = DATA(l_value) ).

        lo_request->set_header_fields( VALUE #( ( name = 'Accept' value = 'application/json' )  ) ).

        DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).
        DATA(lv_status) = lo_response->get_status( ).

        DATA(lv_response) = lo_response->get_text( ).

        out->write( |HTTP Status: { lv_status-code }| ).
        out->write( |Reason: { lv_status-reason }| ).

        out->write( lv_response ).

      CATCH cx_web_http_client_error
                cx_web_message_error
                cx_http_dest_provider_error
                INTO DATA(lx_error).

        out->write( lx_error->get_text( ) ).

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
