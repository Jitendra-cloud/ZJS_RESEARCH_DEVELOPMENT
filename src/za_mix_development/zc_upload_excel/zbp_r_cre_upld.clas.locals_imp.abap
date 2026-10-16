CLASS LHC_ZCJS_R_CRE_UPLD DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR CRE
        RESULT result,
      fill_database FOR DETERMINE ON MODIFY
            keys FOR CRE~fill_database.

ENDCLASS.

CLASS LHC_ZCJS_R_CRE_UPLD IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.



  METHOD fill_database.

    READ ENTITIES OF zcjs_r_cre_upld IN LOCAL MODE
      ENTITY cre
      FIELDS (
        ExcelFilename
        TargetDatabase
      )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_data).

    DATA lt_update TYPE TABLE FOR UPDATE zcjs_r_cre_upld.

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<ls_data>).

      DATA lv_filename   TYPE string.
      DATA lv_table_name TYPE sxco_dbt_object_name.
      DATA lv_exists     TYPE abap_bool.

      lv_filename = <ls_data>-ExcelFilename.

      "------------------------------------------------------------
      " Remove URL encoded spaces
      " Example:
      " 01.%20ADR6.xlsx -> 01. ADR6.xlsx
      "------------------------------------------------------------
      REPLACE ALL OCCURRENCES OF '%20' IN lv_filename WITH space.

      "------------------------------------------------------------
      " Remove .xlsx
      "------------------------------------------------------------
      IF strlen( lv_filename ) >= 5.

        IF to_upper(
             substring(
               val = lv_filename
               off = strlen( lv_filename ) - 5
             )
           ) = '.XLSX'.

          lv_filename = substring(
            val = lv_filename
            off = 0
            len = strlen( lv_filename ) - 5
          ).

        ENDIF.

      ENDIF.

      "------------------------------------------------------------
      " Remove .xls
      "------------------------------------------------------------
      IF strlen( lv_filename ) >= 4.

        IF to_upper(
             substring(
               val = lv_filename
               off = strlen( lv_filename ) - 4
             )
           ) = '.XLS'.

          lv_filename = substring(
            val = lv_filename
            off = 0
            len = strlen( lv_filename ) - 4
          ).

        ENDIF.

      ENDIF.

      "------------------------------------------------------------
      " Remove spaces
      " Example:
      " 01. ADR6
      " becomes:
      " 01.ADR6
      "------------------------------------------------------------
      CONDENSE lv_filename NO-GAPS.

      "------------------------------------------------------------
      " Remove numeric prefix
      "
      " 01.ADR6  -> ADR6
      " 01.ADR6  -> ADR6
      "------------------------------------------------------------
      DATA(lv_dot_position) = find(
        val = lv_filename
        sub = '.'
      ).

      IF lv_dot_position > 0.

        DATA(lv_prefix) = substring(
          val = lv_filename
          off = 0
          len = lv_dot_position
        ).

        DATA(lv_is_number) = abap_true.

        DO strlen( lv_prefix ) TIMES.

          DATA(lv_char) = substring(
            val = lv_prefix
            off = sy-index - 1
            len = 1
          ).

          IF lv_char < '0' OR lv_char > '9'.
            lv_is_number = abap_false.
            EXIT.
          ENDIF.

        ENDDO.

        IF lv_is_number = abap_true.

          lv_filename = substring(
            val = lv_filename
            off = lv_dot_position + 1
          ).

        ENDIF.

      ENDIF.

      "------------------------------------------------------------
      " Final cleanup
      "------------------------------------------------------------
      CONDENSE lv_filename NO-GAPS.

      "------------------------------------------------------------
      " Create target table name
      "------------------------------------------------------------
      lv_table_name = |ZDJS_{ to_upper( lv_filename ) }|.


      "------------------------------------------------------------
      " XCO: Check whether DDIC database table exists
      "------------------------------------------------------------

      lv_exists = abap_false.

      TRY.

          DATA(lo_database_table) =
            xco_cp_abap_dictionary=>database_table(
              iv_name = lv_table_name
            ).

          lv_exists = lo_database_table->exists( ).

        CATCH cx_root.
          lv_exists = abap_false.

      ENDTRY.

      "------------------------------------------------------------
      " Update TargetDatabase
      "------------------------------------------------------------

      APPEND VALUE #(
        %tky = <ls_data>-%tky
        TargetDatabase = COND #(  WHEN lv_exists = abap_true
                                  THEN lv_table_name
                                  ELSE 'No Database' ) ) TO lt_update.

    ENDLOOP.

    "------------------------------------------------------------
    " Update entity in local mode
    "------------------------------------------------------------

    MODIFY ENTITIES OF zcjs_r_cre_upld IN LOCAL MODE
      ENTITY cre
      UPDATE FIELDS ( TargetDatabase )
      WITH lt_update
      FAILED DATA(lt_failed)
      REPORTED DATA(lt_reported).

  ENDMETHOD.

ENDCLASS.
