@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base view of Item table'
@VDM.viewType: #COMPOSITE
define view entity ZCJS_I_ITEMS
  as select from zdjs_items
  association [0..1] to ZCJS_I_INVOICE  as _Invoice  on $projection.DocumentNumber = _Invoice.DocumentNumber
  association [0..1] to ZCJS_I_MATERIAL as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key document   as DocumentNumber,
  key pos_number as ItemNumber,
      material   as MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      quantity   as ItemQuantity,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      price      as ItemPrice,
      currency   as ItemCurrency,
      _Invoice,
      _Material,
      _Material.StockUnit
}
