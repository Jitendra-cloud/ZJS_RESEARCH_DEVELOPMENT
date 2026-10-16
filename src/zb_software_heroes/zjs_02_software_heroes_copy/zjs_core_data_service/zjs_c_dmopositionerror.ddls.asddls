@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Positions with error'
define view entity ZJS_C_DMOPOSITIONERROR
  as select from ZJS_I_DMOPOSITION
{
  key DocumentNumber,
  key PositionNumber,
      MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'PositionUnit'
      PositionQuantity,
      PositionUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      PositionPrice,
      PositionCurrency,
      case PositionPrice
        when 37707 then 'X'
        else ' '
      end as ErrorInConversion
}
