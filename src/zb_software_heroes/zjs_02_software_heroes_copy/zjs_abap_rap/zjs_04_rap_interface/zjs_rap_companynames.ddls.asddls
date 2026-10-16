/********** GENERATED on 01/09/2023 at 20:33:39 by CB9980000024**************/
@OData.entitySet.name: 'CompanyNames'
@OData.entityType.name: 'CompanyNamesType'
define root abstract entity ZJS_RAP_COMPANYNAMES
{
  key CompanyName           : abap.char( 60 );
      @OData.property.valueControl: 'Branch_vc'
      Branch                : abap.char( 50 );
      Branch_vc             : rap_cp_odata_value_control;
      @OData.property.valueControl: 'CompanyDescription_vc'
      CompanyDescription    : abap.char( 255 );
      CompanyDescription_vc : rap_cp_odata_value_control;

}
