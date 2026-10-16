@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Partner in Europe'
define view entity ZJS_C_DMOPARTNEREUROPE
  as select from ZJS_I_DMOPARTNER
{
  key PartnerName,
      City,
      Country
}
where
     Country = 'DE'
  or Country = 'CH'
