@Metadata.ignorePropagatedAnnotations: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Union example'
define view entity ZJS_I_DMOUNION
  as select from ZJS_C_DMOPOSITIONERROR
{

  key DocumentNumber,
  key PositionNumber,
      'Normal' as PositionType,
      @Semantics.amount.currencyCode: 'POSITIONCURRENCY'
      PositionPrice,
      PositionCurrency
}
where
  ErrorInConversion = ' '
union select from ZJS_C_DMOPOSITIONERROR
{

  key DocumentNumber,
  key PositionNumber,
      'Error'                      as PositionType,
      cast( 0 as abap.curr(15,2) ) as PositionPrice,
      PositionCurrency
}
where
  ErrorInConversion = 'X'
