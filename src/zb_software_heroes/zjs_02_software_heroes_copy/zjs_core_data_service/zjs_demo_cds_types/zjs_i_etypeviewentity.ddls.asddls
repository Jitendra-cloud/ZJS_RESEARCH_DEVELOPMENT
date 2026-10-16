@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity'
define root view entity ZJS_I_ETYPEVIEWENTITY
  as select from zjs_dmo_partner
{
  key partner          as Partner,
      name             as Name,
      street           as Street,
      city             as City,
      country          as Country,
      payment_currency as PaymentCurrency
}
