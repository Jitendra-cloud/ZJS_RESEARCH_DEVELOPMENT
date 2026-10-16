@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection'
define root view entity ZJS_C_ETYPEPROJECTION
  provider contract transactional_query
  as projection on ZJS_I_ETYPEVIEWENTITY
{
  key Partner,
      Name,
      Street,
      City,
      Country,
      PaymentCurrency
}
