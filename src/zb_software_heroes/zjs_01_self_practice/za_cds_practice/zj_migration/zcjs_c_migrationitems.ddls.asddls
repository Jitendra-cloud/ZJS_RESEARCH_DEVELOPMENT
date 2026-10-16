@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Migration Example (Consumption)'
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_MigrationItems
  as select from ZCJS_I_MigrationItems
  association to ZCJS_I_MATERIAL as _Material on $projection.Material = _Material.MaterialNumber
{
  key Document,
  key PosNumber,
      Material,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      Quantity,
      @Semantics.amount.currencyCode: 'Currency'
      Price,
      Currency,
      _Material,
      _Material.StockUnit
}
