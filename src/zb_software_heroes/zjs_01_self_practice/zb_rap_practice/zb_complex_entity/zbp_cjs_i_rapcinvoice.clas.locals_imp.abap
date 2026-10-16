CLASS lhc_ZCJS_I_RAPCInvoice DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Invoice RESULT result.

*    METHODS createinvoicedocument FOR MODIFY
*      IMPORTING keys FOR ACTION invoice~createinvoicedocument.

    METHODS createmultipleinvoices FOR MODIFY
      IMPORTING keys FOR ACTION invoice~createmultipleinvoices.

ENDCLASS.

CLASS lhc_ZCJS_I_RAPCInvoice IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

*  METHOD CreateInvoiceDocument.
*    DATA lt_document TYPE TABLE FOR ACTION IMPORT ZCJS_I_RAPCInvoice~CreateInvoiceDocument.
*
*    TRY.
*        lt_document = VALUE #( (  %cid   = to_upper( cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ) )
*                                  %param = VALUE #( Document  = 'TEST'
*                                                    Partner   = '1000000004'
*                                                    _items = VALUE #(   Unit     = 'ST'
*                                                                        Currency = 'EUR'
*                                                                        ( Material = 'F0001' Quantity = '2' Price = '13.12' )
*                                                                        ( Material = 'H0001' Quantity = '1' Price = '28.54' ) )   ) ) ).
*      CATCH cx_uuid_error.
*    ENDTRY.
*
*    MODIFY ENTITIES OF ZCJS_I_RAPCInvoice
*            ENTITY Invoice
*            EXECUTE CreateInvoiceDocument FROM lt_document
*            FAILED DATA(ls_failed_deep)
*            REPORTED DATA(ls_reported_deep).
*  ENDMETHOD.

  METHOD CreateMultipleInvoices.
    IF 0 = 0.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
