CLASS zcljs_table_data_operation DEFINITION PUBLIC FINAL CREATE PUBLIC.
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA lt_data TYPE STANDARD TABLE OF zdjs_un_data.

    METHODS:
      create_test_data,
      delete_from_table,
      create_test_data_from_table,
      copy_from_one_to_other_dtbase.

ENDCLASS.



CLASS ZCLJS_TABLE_DATA_OPERATION IMPLEMENTATION.


  METHOD copy_from_one_to_other_dtbase.

*        SELECT * FROM zdemo_abap_flsch INTO TABLE @data(lt_flsch).
*        INSERT zdjs_abap_flsch FROM TABLE @lt_flsch.

*        SELECT * FROM zdjs_items INTO TABLE @data(lt_items).
*        INSERT zdjs_items2 FROM TABLE @lt_items.

    DELETE FROM zjs_abap_tab2.
    SELECT * FROM zdemo_abap_tab2 INTO TABLE @DATA(lt_tab2).
    INSERT zjs_abap_tab2 FROM TABLE @lt_tab2.

  ENDMETHOD.


  METHOD create_test_data.
    lt_data = VALUE #(
                          ( gen_key = '55d0e0a7-61f2-48e4-aa48-f9c3b7855f5b' text = 'SAP1' cdate = '20231225' )
                          ( gen_key = 'd7ef9ace-3c48-4df3-915d-6619befad73e' text = 'SAP2' cdate = '20300823' )
                          ( gen_key = '3f7d4363-5270-4d37-b782-c553445a9769' text = 'SAP3' cdate = '20120929' )
                          ( gen_key = '62480116-dacb-42bb-b19f-f7188c3c0b7d' text = 'SAP4' cdate = '20271020' ) ).

    DELETE FROM zdjs_un_data.
    INSERT zdjs_un_data FROM TABLE @lt_data.
  ENDMETHOD.


  METHOD create_test_data_from_table.

    DATA ls_invoice TYPE zdse_invoice.

    SELECT * FROM zdjs_invoice INTO TABLE @DATA(lt_result).

    LOOP AT lt_result INTO DATA(ls_result).
      ls_invoice-document = ls_result-document.
      ls_invoice-doc_date = ls_result-doc_date.
      ls_invoice-doc_time = ls_result-doc_time.
      ls_invoice-partner  = ls_result-partner.

*        APPEND ls_invoice to zdse_invoice.
      INSERT zdse_invoice FROM @ls_invoice.
    ENDLOOP.

*      zdse_invoice = value #( for ls_line1 in lt_result )

*     INSERT VALUE #(  )

  ENDMETHOD.


  METHOD delete_from_table.

    DELETE FROM zdjs_invoice WHERE doc_date IS INITIAL.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
*    create_test_data( ).
*    out->write( |Partner: { lines( lt_data ) }| ).

*    delete_from_table(  ).

*     create_test_data_from_table( ).

    copy_from_one_to_other_dtbase(  ).

  ENDMETHOD.
ENDCLASS.
