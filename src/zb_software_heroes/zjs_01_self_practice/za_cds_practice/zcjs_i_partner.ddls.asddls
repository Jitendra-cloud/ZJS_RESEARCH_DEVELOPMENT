@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base view of partner table'
@VDM.viewType: #COMPOSITE
define view entity ZCJS_I_PARTNER
  as select from zdjs_partner
  association [0..1] to I_Country  as _Country  on $projection.Country = _Country.Country
  association [0..1] to I_Currency as _Currency on $projection.PaymentCurrency = _Currency.Currency
{
  key partner          as PartnerNumber,
      name             as PartnerName,
      street           as Street,
      city             as City,
      country          as Country,
      payment_currency as PaymentCurrency,
      _Country,
      _Currency
}
