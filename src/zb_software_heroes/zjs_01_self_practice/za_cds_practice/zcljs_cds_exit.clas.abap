CLASS zcljs_cds_exit DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCLJS_CDS_EXIT IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA:
    lt_view_data TYPE STANDARD TABLE OF ZCJS_C_PricePerUnit WITH EMPTY KEY.

    lt_view_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_view_data REFERENCE INTO DATA(lr_view_data).
      lr_view_data->PricePerUnit = lr_view_data->ItemPrice / lr_view_data->ItemQuantity.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_view_data ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
