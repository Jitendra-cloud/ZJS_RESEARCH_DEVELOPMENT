CLASS zcl_js_demo_cds_types DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS ZCL_JS_DEMO_CDS_TYPES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA ld_simple TYPE ZJS_DemoCDSInvoiceStatus.
    DATA ld_enum   TYPE ZJS_DemoCDSInvoiceStatusEnum.

    ld_simple = 'C'.
    ld_enum = ZJS_DemoCDSInvoiceStatusEnum-created.

*    ld_enum = 'C'.
    ld_enum = CONV #( 'C' ).

    out->write( `Simple type:` ).
    out->write( ld_simple ).
    out->write( `Enum type:` ).
    out->write( ld_enum ).
  ENDMETHOD.
ENDCLASS.
