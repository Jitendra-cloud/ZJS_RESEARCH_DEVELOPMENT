@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sum for Partner'
define view entity ZJS_C_DMOPARTNERSUM
  as select from ZJS_I_DMOPOSITION
{
  key ZJS_I_DMOPOSITION._Invoice.PartnerNumber,
      PositionCurrency,
      @Semantics.amount.currencyCode: 'POSITIONCURRENCY'
      sum ( PositionPrice ) as PriceForPartnerMaterial

}
group by
  ZJS_I_DMOPOSITION._Invoice.PartnerNumber,
  PositionCurrency
