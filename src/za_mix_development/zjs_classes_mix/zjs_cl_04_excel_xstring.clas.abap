CLASS zjs_cl_04_excel_xstring DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES: BEGIN OF ty_data,
             database TYPE tabname,
             val_cat  TYPE char20,
             value    TYPE xstring,
           END OF ty_data.

    DATA: lt_data TYPE STANDARD TABLE OF ty_data,
          lv_len  TYPE i,
          lv_off  TYPE i VALUE 0,
          lv_cnt  TYPE i VALUE 1.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zjs_cl_04_excel_xstring IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT * FROM zdjs_cre_upld
    INTO TABLE @DATA(lt_attachement).

    SORT lt_attachement BY excel_filename ASCENDING.

    LOOP AT lt_attachement INTO DATA(ls_attachement).

      out->write( | { ls_attachement-target_database } : Total Lenght of XSTRING : ({ xstrlen( ls_attachement-excel_attachment ) })| ).

      lv_len = xstrlen( ls_attachement-excel_attachment ).

      WHILE lv_off < lv_len.

        DATA(lv_chunk_len) = COND i(
                               WHEN lv_len - lv_off >= 100
                               THEN 100
                               ELSE lv_len - lv_off ).

        APPEND VALUE ty_data(
          database = ls_attachement-target_database
          val_cat  = |XSTRING VAL { lv_cnt }|
          value    = ls_attachement-excel_attachment+lv_off(lv_chunk_len)
        ) TO lt_data.

        lv_off += lv_chunk_len.
        lv_cnt += 1.

      ENDWHILE.

      DATA(a) = 1.


    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
