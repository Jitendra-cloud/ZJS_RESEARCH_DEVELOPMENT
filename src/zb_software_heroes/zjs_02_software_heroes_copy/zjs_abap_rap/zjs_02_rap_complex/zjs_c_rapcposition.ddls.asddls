@EndUserText.label: 'Consumption for ZJS_I_RAPCPOSITION'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZJS_C_RAPCPOSITION
  as projection on ZJS_I_RAPCPosition as Position
{
  key Document,
  key PositionNumber,
      Material,
      Quantity,
      Unit,
      Price,
      Currency,
      _Invoice : redirected to parent ZJS_C_RAPCInvoice
}
