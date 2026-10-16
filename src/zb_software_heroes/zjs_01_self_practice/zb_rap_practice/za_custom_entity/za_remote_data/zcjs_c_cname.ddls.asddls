@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption: Company Name'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCJS_C_CNAME
  provider contract transactional_query
  as projection on ZCJS_I_CNAME
{
  key CompanyName,
      Branch,
      CompanyDescription
}   
