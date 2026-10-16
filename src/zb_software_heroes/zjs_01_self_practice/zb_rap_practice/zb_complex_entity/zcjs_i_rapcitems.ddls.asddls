@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for ZDJS_ITEMS'
define view entity ZCJS_I_RAPCItems
  as select from zdjs_items
  association     to parent ZCJS_I_RAPCInvoice as _Invoice  on $projection.Document = _Invoice.Document
  association [1] to ZCJS_I_RAPCMaterial       as _Material on $projection.Material = _Material.Material
{
  key document            as Document,
  key pos_number          as ItemNumber,
      material            as Material,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      quantity            as Quantity,
      _Material.StockUnit as Unit,
      price               as Price,
      currency            as Currency,
      _Invoice
}
