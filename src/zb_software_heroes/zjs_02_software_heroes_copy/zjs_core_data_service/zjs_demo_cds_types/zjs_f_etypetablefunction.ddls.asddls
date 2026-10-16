@EndUserText.label: 'Table Function'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ClientHandling.type: #CLIENT_DEPENDENT
@ClientHandling.clientSafe: true
@ClientHandling.algorithm: #SESSION_VARIABLE
define table function ZJS_F_ETYPETABLEFUNCTION
  with parameters
    partner : abap.char( 10 )
returns
{
  Client   : abap.clnt;
  Material : abap.char(5);
  Discount : abap.dec(5,2);

}
implemented by method
  zcl_js_demo_etpye_tfunc=>get_all_discounts;