@EndUserText.label: 'Consumption: Company name'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZJS_C_DMOCNAME
  provider contract transactional_query
  as projection on ZJS_I_DMOCNAME
{
  key CompanyName,
      Branch,
      CompanyDescription
}
