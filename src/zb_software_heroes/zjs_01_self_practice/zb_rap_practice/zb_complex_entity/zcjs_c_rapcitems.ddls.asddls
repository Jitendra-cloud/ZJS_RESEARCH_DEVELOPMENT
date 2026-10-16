@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for ZCJS_I_RAPCItems'
@Metadata.allowExtensions: true
define view entity ZCJS_C_RAPCItems
  as projection on ZCJS_I_RAPCItems as Items
{
  key Document,
  key ItemNumber,
      Material,
      Quantity,
      Unit,
      Price,
      Currency,
      _Invoice : redirected to parent ZCJS_C_RAPCInvoice
}
