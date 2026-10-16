    CLASS zcljs_gen_data DEFINITION PUBLIC FINAL CREATE PUBLIC .

      PUBLIC SECTION.

        INTERFACES if_oo_adt_classrun.
        CLASS-METHODS:
          rebuild_data.

      PROTECTED SECTION.
      PRIVATE SECTION.

        CONSTANTS:
*            c_destination TYPE string VALUE `destination-service-id`.
             c_destination TYPE string VALUE 'https://685bd85e-501d-43dd-b091-aa6811254f67.abap-web.us10.hana.ondemand.com/sap/opu/odata/sap/ZUJS_COMPANY_NAME_V2_API'.

        METHODS:
          get_client
            RETURNING VALUE(ro_result) TYPE REF TO if_web_http_client
            RAISING
                      cx_http_dest_provider_error
                      cx_web_http_client_error.

ENDCLASS.



CLASS ZCLJS_GEN_DATA IMPLEMENTATION.


      METHOD get_client.

        DATA(lo_destination) = cl_http_destination_provider=>create_by_cloud_destination( i_name       = c_destination
                                                                                          i_authn_mode = if_a4c_cp_service=>service_specific ).
        ro_result  = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).

      ENDMETHOD.


      METHOD if_oo_adt_classrun~main.
*    zcljs_gen_data=>rebuild_data( ).

*        DATA:
*          lt_business_data TYPE TABLE OF zcjs_i_cname.
*
*        TRY.
*            DATA(lo_client_proxy) = cl_web_odata_client_factory=>create_v2_remote_proxy(
*              EXPORTING
*                iv_service_definition_name = 'ZSJS_RAP_ONPREM_ODATA'
*                io_http_client             = get_client( )
*                iv_relative_service_root   = '/sap/opu/odata/sap/ZUJS_COMPANY_NAME_V2_API' ).
*
*            DATA(lo_request) = lo_client_proxy->create_resource_for_entity_set( 'COMPANYNAMES' )->create_request_for_read( ).
*            lo_request->set_top( 50 )->set_skip( 0 ).
*
*            DATA(lo_response) = lo_request->execute( ).
*            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
*
*            out->write( 'Data on-premise found:' ).
*            out->write( lt_business_data ).
*
*          CATCH cx_root INTO DATA(lo_error).
*            out->write( lo_error->get_text( ) ).
*        ENDTRY.


        DATA:
          lt_business_data TYPE TABLE OF zsjs_rap_onprem_odata=>tys_company_names_type,
          lo_http_client   TYPE REF TO if_web_http_client,
          lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
          lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
          lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

*        DATA:
*         lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
*         lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
*         lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
*         lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
*         lt_range_COMPANY_NAME TYPE RANGE OF <element_name>,
*         lt_range_BRANCH TYPE RANGE OF <element_name>.



        TRY.
            " Create http client
            DATA(lo_destination) = cl_http_destination_provider=>create_by_url( i_url = c_destination  ).
            lo_http_client = cl_web_http_client_manager=>create_by_http_destination( lo_destination ).
            lo_client_proxy = /iwbep/cl_cp_factory_remote=>create_v2_remote_proxy(
              EXPORTING
                 is_proxy_model_key       = VALUE #( repository_id       = 'DEFAULT'
                                                     proxy_model_id      = 'ZSJS_RAP_ONPREM_ODATA'
                                                     proxy_model_version = '0001' )
                io_http_client             = lo_http_client
                iv_relative_service_root   = 'CompanyNames' ).

            ASSERT lo_http_client IS BOUND.


            " Navigate to the resource and create a request for the read operation
            lo_request = lo_client_proxy->create_resource_for_entity_set( 'COMPANY_NAMES' )->create_request_for_read( ).

            " Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'COMPANY_NAME'
*                                                        it_range             = lt_range_COMPANY_NAME ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'BRANCH'
*                                                        it_range             = lt_range_BRANCH ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

            lo_request->set_top( 50 )->set_skip( 0 ).

            " Execute the request and retrieve the business data
            lo_response = lo_request->execute( ).
            lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).

          CATCH /iwbep/cx_cp_remote INTO DATA(lx_remote).
            " Handle remote Exception
            " It contains details about the problems of your http(s) connection

          CATCH /iwbep/cx_gateway INTO DATA(lx_gateway).
            " Handle Exception

          CATCH cx_web_http_client_error cx_http_dest_provider_error INTO DATA(lx_web_http_client_error).
            " Handle Exception
            RAISE SHORTDUMP lx_web_http_client_error.


        ENDTRY.
      ENDMETHOD.


      METHOD rebuild_data.
        DATA:
          lt_names TYPE SORTED TABLE OF zdjs_cname WITH UNIQUE KEY name.

        lt_names = VALUE #(   ( name = 'SAP'
                                branch = 'Software'
                                description = 'SAP SE is a German multinational software company based in Walldorf, Baden-Württemberg. It develops enterprise software to manage business operations and customer relations.' )
                              ( name = 'Microsoft'
                                branch = 'Software'
                                description = 'Microsoft Corporation is an American multinational technology corporation producing computer software, consumer electronics, personal computers, and related services.' )
                              ( name = 'BMW'
                                branch = 'Automotive Industry'
                                description = 'Bayerische Motoren Werke AG, abbreviated as BMW, is a German multinational manufacturer of luxury vehicles and motorcycles headquartered in Munich, Bavaria.' )
                              ( name = 'Nestle'
                                branch = 'Food'
                                description = 'Nestlé S.A. is a Swiss multinational food and drink processing conglomerate corporation headquartered in Vevey, Vaud, Switzerland.' )
                              ( name = 'Amazon'
                                branch = 'Online Trade'
                                description = 'Amazon.com, Inc. is an American multinational technology company focusing on e-commerce, cloud computing, online advertising, digital streaming, and artificial intelligence.' )
                          ).

        INSERT zdjs_cname FROM TABLE @lt_names.
        COMMIT WORK.
      ENDMETHOD.
ENDCLASS.
