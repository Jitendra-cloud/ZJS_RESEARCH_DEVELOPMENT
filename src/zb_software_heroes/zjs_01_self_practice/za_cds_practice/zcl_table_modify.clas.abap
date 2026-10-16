CLASS zcl_table_modify DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLE_MODIFY IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA lt_table TYPE STANDARD TABLE OF zdjs_items.
*    SELECT * FROM zdjs_items INTO TABLE @lt_table.
*    LOOP AT  lt_table ASSIGNING FIELD-SYMBOL(<ls_table>).
*      IF <ls_table>-document = '30000040'.
*        <ls_table>-quantity = 4.
*        CLEAR <ls_table>-currency. " = ''.
*      ENDIF.
*    ENDLOOP.
*    DELETE FROM zdjs_items.
*    INSERT zdjs_items FROM TABLE @lt_table.

*    SELECT FROM ZCJS_I_Invoice
*      FIELDS DocumentNumber, PartnerNumber, \_Partner-PartnerName, \_Partner-City
*      INTO TABLE @DATA(lt_association)
*      UP TO 10 ROWS.

*    SELECT FROM zcjs_c_parameter(  p_date = '20240410'
*                                 , p_type = 'A'
*                                 , p_field = 'HELLO' )
*    FIELDS *
*    INTO TABLE @DATA(lt_parameter).

    DATA lv_sample TYPE ztjs_cdsinvoicestatus.
    lv_sample = 'C'.
    out->write( 'Simple Type:' ).
    out->write( lv_sample ).

    DATA lv_enum TYPE ztjs_cdsinvoicestatusenum.
    lv_enum = ztjs_cdsinvoicestatusenum-payed.
    out->write( 'Enum Type:' ).
    out->write( lv_enum ).

    lv_enum = CONV #( 'C' ).
    out->write( 'Conv Sample:' ).
    out->write( lv_enum ).

  ENDMETHOD.
ENDCLASS.
