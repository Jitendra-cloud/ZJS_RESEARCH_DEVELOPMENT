@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base for Auth Test'
define view entity ZJS_I_DMOAUTHBASE
  as select from ZJS_B_DMOAUTHBASE
{
  key Material,
      MaterialName,
      Description,
      Stock,
      Unit,
      PricePerUnit,
      Currency
}
