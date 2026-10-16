CLASS zcl_js_demo_etpye_tfunc DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS get_all_discounts FOR TABLE FUNCTION ZJS_F_ETypeTableFunction.
ENDCLASS.



CLASS ZCL_JS_DEMO_ETPYE_TFUNC IMPLEMENTATION.


  METHOD get_all_discounts BY DATABASE FUNCTION
    FOR HDB
    LANGUAGE SQLSCRIPT
    OPTIONS READ-ONLY
    USING zbs_dmo_partner zbs_dmo_discount.

    discounts =
      SELECT discount.client as Client, discount.material as Material, discount.discount as Discount
        FROM zbs_dmo_partner as partner
        LEFT OUTER JOIN zbs_dmo_discount as discount
        ON discount.client = partner.client AND discount.partner = partner.partner
      WHERE partner.partner = :partner;

    RETURN :discounts;
  ENDMETHOD.
ENDCLASS.
