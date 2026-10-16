CLASS zcl_eml_crud DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_EML_CRUD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_selection TYPE TABLE FOR READ IMPORT zcjs_i_rappartner.
    lt_selection = VALUE #( ( PartnerNumber = '1000000001' )
                            ( PartnerNumber = '1000000003' ) ).

*    READ ENTITIES OF zcjs_i_rappartner ENTITY Partner
*      ALL FIELDS WITH lt_selection
*      RESULT DATA(lt_partner_result)
*      FAILED DATA(lt_partner_failed)
*      REPORTED DATA(ls_reported).
*    out->write( lt_partner_result ).

*    READ ENTITIES OF zcjs_i_rappartner ENTITY Partner
*      FIELDS ( PartnerName Street City ) WITH VALUE #( ( PartnerNumber = '1000000001' )
*                                                       ( PartnerNumber = '1000000003' ) )
*      RESULT DATA(lt_partner_short)
*      FAILED DATA(ls_failed)
*      REPORTED DATA(ls_reported).
*    out->write( lt_partner_short ).

*    DATA: lt_creation TYPE TABLE FOR CREATE zcjs_i_rappartner.
*        lt_creation = VALUE #( ( %cid = 'DummyKey1'
*                                 PartnerNumber = '1000000007'
*                                 PartnerName = 'Amazon'
*                                 Country = 'US'
*                                 %control-PartnerNumber = if_abap_behv=>mk-on
*                                 %control-PartnerName = if_abap_behv=>mk-on
*                                 %control-Country = if_abap_behv=>mk-on ) ).
*                MODIFY ENTITIES OF zcjs_i_rappartner ENTITY Partner
*                CREATE FROM lt_creation
*                FAILED DATA(ls_failed)
*                MAPPED DATA(ls_mapped)
*                REPORTED DATA(ls_reported).
*        TRY.
*            out->write( ls_mapped-partner[ 1 ]-PartnerNumber ).
*            COMMIT ENTITIES.
*
*          CATCH cx_sy_itab_line_not_found.
*            out->write( ls_failed-partner[ 1 ]-%cid ).
*        ENDTRY.

*    DATA: lt_update TYPE TABLE FOR UPDATE ZCJS_I_RapPartner.
*    lt_update = VALUE #( ( PartnerNumber = '1000000007'
*                           PartnerName = 'Amazon Fake'
*                           City = 'Seattle'
*                           PaymentCurrency = 'USD'
*                           %control-PartnerName = if_abap_behv=>mk-on
*                           %control-PaymentCurrency = if_abap_behv=>mk-on
*                           %control-City = if_abap_behv=>mk-on ) ).
*    MODIFY ENTITIES OF ZCJS_I_RapPartner ENTITY Partner
*     UPDATE FROM lt_update
*          FAILED DATA(ls_failed)
*          MAPPED DATA(ls_mapped)
*          REPORTED DATA(ls_report).
*
*    IF ls_failed-partner IS INITIAL.
*      out->write( 'Updated' ).
*      COMMIT ENTITIES.
*    ENDIF.

*     MODIFY ENTITIES OF ZCJS_I_RAPPartner
*      ENTITY Partner EXECUTE fillEmptyStreets_P FROM VALUE #( ( PartnerNumber = '1000000008' ) )  RESULT DATA(lt_new_partner)
*                                                                                                  MAPPED DATA(ls_mapped)
*                                                                                                  FAILED DATA(ls_failed)
*                                                                                                  REPORTED DATA(ls_reported).
*    COMMIT ENTITIES.
*    IF line_exists( lt_new_partner[ 1 ] ).
*      out->write( lt_new_partner[ 1 ]-PartnerNumber ).
*      out->write( lt_new_partner[ 1 ]-%param ).
*    ELSE.
*      out->write( `Not worked` ).
*    ENDIF.

""-----------------------------EML-PART-2--------Reading-Complex-Entity(Child-Entity)---------------------------------
         ""------------------------------Reading----------------------------------------------
*         DATA lt_filter TYPE STANDARD TABLE OF ZCJS_I_RAPCInvoice WITH EMPTY KEY.
*             lt_filter = VALUE #( ( Document = '30000000' ) ( Document = '30000005' ) ).
*             READ ENTITIES OF ZCJS_I_RAPCInvoice ENTITY Invoice ALL FIELDS WITH CORRESPONDING #( lt_filter ) RESULT DATA(lt_invoice)
*                 ENTITY Invoice BY \_Items FIELDS ( Document ItemNumber Material ) WITH CORRESPONDING #( lt_filter )  RESULT DATA(lt_items)
*                                                                                                                  FAILED FINAL(ls_failed).
         ""------------------------------Reading----------------------------------------------

         ""------------------------------Inserting/Creating----------------------------------------------
*                DATA lt_new_invoice  TYPE TABLE FOR CREATE ZCJS_I_RAPCInvoice.
*                DATA lt_new_item TYPE TABLE FOR CREATE ZCJS_I_RAPCInvoice\_Items.
*
*                lt_new_invoice  = VALUE #( ( %cid = 'B1' Document = '40000000' Partner  = '1000000004'                        %control = VALUE #( Document = if_abap_behv=>mk-on Partner = if_abap_behv=>mk-on ) ) ).
*                lt_new_item     = VALUE #( ( %cid_ref = 'B1'
*                                             %target  = VALUE #( ( %cid = 'P1' ItemNumber = 1 Material = 'R0001'              %control = VALUE #( ItemNumber = if_abap_behv=>mk-on Material = if_abap_behv=>mk-on ) )
*                                                                 ( %cid = 'P2' ItemNumber = 2 Price = '2.20' Currency = 'EUR' %control = VALUE #( ItemNumber = if_abap_behv=>mk-on Price = if_abap_behv=>mk-on Currency = if_abap_behv=>mk-on ) ) ) ) ).
*                MODIFY ENTITIES OF ZCJS_I_RAPCInvoice
*                   ENTITY Invoice
*                   CREATE FROM lt_new_invoice
*                       ENTITY Invoice
*                       CREATE BY \_Items FROM lt_new_item
*               FAILED DATA(ls_failed).
*               COMMIT ENTITIES.
         ""------------------------------Inserting/Creating----------------------------------------------

         ""------------------------------Inserting-Only-Child-Entity-------------------------------------
*        DATA lt_new_invoice2  TYPE TABLE FOR CREATE ZCJS_I_RAPCInvoice.
*        DATA lt_new_item2 TYPE TABLE FOR CREATE ZCJS_I_RAPCInvoice\_Items.
*         ""%control = VALUE #( Document = if_abap_behv=>mk-on Partner = if_abap_behv=>mk-on ) ) ).
*        lt_new_invoice2  = VALUE #( ( %cid = 'B1' Document = '40000000'  %control = VALUE #( Document = if_abap_behv=>mk-on ) ) ).
*        lt_new_item2     = VALUE #( ( %cid_ref = 'B1'
*                                      %target  = VALUE #( ( %cid = 'P1' ItemNumber = 5 Material = 'R0001' Price = '10.30' Currency = 'USD'
*                                                            %control = VALUE #( ItemNumber = if_abap_behv=>mk-on Material = if_abap_behv=>mk-on Price = if_abap_behv=>mk-on Currency = if_abap_behv=>mk-on ) )
*                                                          ( %cid = 'P2' ItemNumber = 6 Material = 'R0003' Price = '11.20' Currency = 'EUR'
*                                                            %control = VALUE #( ItemNumber = if_abap_behv=>mk-on Material = if_abap_behv=>mk-on Price = if_abap_behv=>mk-on Currency = if_abap_behv=>mk-on ) ) ) ) ).
*        MODIFY ENTITIES OF ZCJS_I_RAPCInvoice
*            ENTITY Invoice
*            CREATE FROM lt_new_invoice2
*               ENTITY Invoice
*               CREATE BY \_Items FROM lt_new_item2
*       FAILED DATA(ls_failed2).
*       COMMIT ENTITIES.
         ""------------------------------Inserting-Only-Child-Entity-------------------------------------

         ""--------------------------------------Deleting-------------------------------------------------
*            DATA lt_filter TYPE STANDARD TABLE OF ZCJS_I_RAPCInvoice WITH EMPTY KEY.
*            lt_filter = VALUE #( ( Document = '40000000' ) ).
*
*            MODIFY ENTITIES OF ZCJS_I_RAPCInvoice ENTITY Invoice DELETE FROM CORRESPONDING #( lt_filter ) FAILED DATA(ls_failed).
*
*            COMMIT ENTITIES.
         ""--------------------------------------Deleting-------------------------------------------------

  ENDMETHOD.
ENDCLASS.
