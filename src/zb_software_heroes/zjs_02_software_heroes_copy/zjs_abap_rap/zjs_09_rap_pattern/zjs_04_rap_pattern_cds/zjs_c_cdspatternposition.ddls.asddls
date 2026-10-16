@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Position'
@Metadata.allowExtensions: true
define view entity ZJS_C_CDSPATTERNPOSITION
  as projection on ZJS_T_CDSPatternPosition
{
  key DocumentNumber,
  key PositionNumber,
      MaterialNumber,
      PositionQuantity,
      PositionUnit,
      PositionPrice,
      PositionCurrency,
      _Document : redirected to parent ZJS_C_CDSPatternInvoice
}
