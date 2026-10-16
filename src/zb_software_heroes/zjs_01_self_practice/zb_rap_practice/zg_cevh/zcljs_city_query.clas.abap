CLASS zcljs_city_query DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCLJS_CITY_QUERY IMPLEMENTATION.


  METHOD if_rap_query_provider~select.

        DATA lt_values TYPE STANDARD TABLE OF ZCJS_I_RAPCityVH WITH EMPTY KEY.

        lt_values = VALUE #( ( City = 'Walldorf' CityShort = 'DE' )
                             ( City = 'Redmond' CityShort = 'US' )
                             ( City = 'Menlo Park' CityShort = 'US' )
                             ( City = 'Hangzhou' CityShort = 'CN' )
                             ( City = 'Munich' CityShort = 'DE' )
                             ( City = 'Vevey' CityShort = 'CH' )
                             ( City = 'Sankt Petersburg' CityShort = 'RU' )
                             ( City = 'Seattle' CityShort = 'US' )
                             ( City = 'Wolfsburg' CityShort = 'DE' )
                             ( City = 'Cologne' CityShort = 'DE' ) ).


        DATA(ld_all_entries) = lines( lt_values ).
        NEW zcljs_adjust_data( )->adjust_via_request( EXPORTING io_request = io_request
                                                       CHANGING  ct_data    = lt_values ).

        IF io_request->is_data_requested( ).
          io_response->set_data( lt_values ).
        ENDIF.

        IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records( lines( lt_values ) ).
        ENDIF.

        io_request->get_sort_elements( ).
        io_request->get_paging( ).

  ENDMETHOD.
ENDCLASS.
