@EndUserText.label: 'Custom entity for company names'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_JS_DEMO_CUST_CNAME_QUERY'
define custom entity ZJS_I_RAPCUSTOMENTITYCNAMES
{
  key CompanyName        : abap.char( 60 );
      Branch             : abap.char( 50 );
      CompanyDescription : abap.char( 255 );
}
