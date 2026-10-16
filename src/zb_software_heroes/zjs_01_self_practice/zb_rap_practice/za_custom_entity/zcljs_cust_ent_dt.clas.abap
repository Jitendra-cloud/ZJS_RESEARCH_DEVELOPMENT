CLASS zcljs_cust_ent_dt DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      tt_r_name        TYPE RANGE OF zdjs_cname-name,
      tt_r_branch      TYPE RANGE OF zdjs_cname-branch,
      tt_r_description TYPE RANGE OF zdjs_cname-description,

      ts_data          TYPE zdjs_cname,
      tt_data          TYPE STANDARD TABLE OF ts_data WITH EMPTY KEY.

    CLASS-METHODS:
      query
        IMPORTING it_r_name        TYPE tt_r_name OPTIONAL
                  it_r_branch      TYPE tt_r_branch OPTIONAL
                  it_r_description TYPE tt_r_description OPTIONAL
        RETURNING VALUE(rt_result) TYPE tt_data.

    INTERFACES if_rap_query_provider.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS get_data_from_request
      IMPORTING io_request       TYPE REF TO if_rap_query_request
                ""RETURNING VALUE(rt_result) TYPE zif_bs_demo_rap_data_handler=>tt_data
      RETURNING VALUE(rt_result) TYPE tt_data
      RAISING   cx_rap_query_filter_no_range.

ENDCLASS.



CLASS ZCLJS_CUST_ENT_DT IMPLEMENTATION.


  METHOD get_data_from_request.
    DATA lt_r_name TYPE tt_r_name.
    DATA lt_r_branch TYPE tt_r_branch.
    DATA lt_r_description TYPE tt_r_description.

    DATA(lt_filter) = io_request->get_filter( )->get_as_ranges( ).
    DATA(ld_offset) = io_request->get_paging( )->get_offset( ).
    DATA(ld_pagesize) = io_request->get_paging( )->get_page_size( ).

    LOOP AT lt_filter INTO DATA(ls_filter).
      CASE ls_filter-name.
        WHEN 'TABLEKEY'.
          lt_r_name = CORRESPONDING #( ls_filter-range ).
        WHEN 'DESCRIPTION'.
          lt_r_branch = CORRESPONDING #( ls_filter-range ).
        WHEN 'CREATIONDATE'.
          lt_r_description = CORRESPONDING #( ls_filter-range ).
      ENDCASE.
    ENDLOOP.

    rt_result = zcljs_cust_ent_dt=>query( it_r_name = lt_r_name
    it_r_branch = lt_r_branch
    it_r_description = lt_r_description ).
  ENDMETHOD.


  METHOD if_rap_query_provider~select.
    DATA lt_output TYPE STANDARD TABLE OF zcjs_i_rapcustomentitycnames.

    TRY.
        DATA(lt_database) = get_data_from_request( io_request ).
      CATCH cx_rap_query_filter_no_range.
    ENDTRY.
    lt_output = CORRESPONDING #( lt_database MAPPING CompanyName = name Branch = branch CompanyDescription = description ).

    IF io_request->is_data_requested( ).
      io_response->set_data( lt_output ).
    ENDIF.

    IF io_request->is_total_numb_of_rec_requested( ).
      io_response->set_total_number_of_records( lines( lt_output ) ).
    ENDIF.
  ENDMETHOD.


  METHOD query.
    SELECT FROM zdjs_cname
    FIELDS *
    WHERE name IN @it_r_name
    AND branch IN @it_r_branch
    AND description IN @it_r_description
    INTO TABLE @rt_result.
  ENDMETHOD.
ENDCLASS.
