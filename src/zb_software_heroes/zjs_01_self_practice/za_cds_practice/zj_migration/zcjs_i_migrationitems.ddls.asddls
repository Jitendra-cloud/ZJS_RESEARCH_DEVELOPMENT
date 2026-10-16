@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Migration Example (Items)'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_I_MigrationItems
  as select from zdjs_items
  association to ZCJS_I_MATERIAL as _Material on $projection.Material = _Material.MaterialNumber
{
  key document   as Document,
  key pos_number as PosNumber,
      material   as Material,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      quantity   as Quantity,
      @Semantics.amount.currencyCode: 'Currency'
      price      as Price,
      currency   as Currency,
      _Material.StockUnit
}
