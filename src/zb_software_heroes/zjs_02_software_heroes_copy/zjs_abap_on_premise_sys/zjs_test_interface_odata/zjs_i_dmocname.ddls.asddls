@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface: Company names'
define root view entity ZJS_I_DMOCNAME
  as select from zjs_dmo_cname
{
  key name        as CompanyName,
      branch      as Branch,
      description as CompanyDescription
}
