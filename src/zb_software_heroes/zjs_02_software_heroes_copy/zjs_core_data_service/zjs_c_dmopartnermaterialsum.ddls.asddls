@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sum for Partner and Material'
define view entity ZJS_C_DMOPARTNERMATERIALSUM
  as select from ZJS_I_DMOPOSITION
{
  key ZJS_I_DMOPOSITION._Invoice.PartnerNumber,
  key MaterialNumber,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'POSITIONCURRENCY' 
sum ( PositionPrice ) as PriceForPartnerMaterial

}
group by
  ZJS_I_DMOPOSITION._Invoice.PartnerNumber,
  MaterialNumber,
  PositionCurrency
