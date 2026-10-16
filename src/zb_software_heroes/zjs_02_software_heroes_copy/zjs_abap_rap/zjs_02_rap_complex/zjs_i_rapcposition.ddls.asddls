@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for ZJS_DMO_POSITION'
define view entity ZJS_I_RAPCPOSITION
  as select from zjs_dmo_position
  association     to parent ZJS_R_RAPCInvoice as _Invoice  on $projection.Document = _Invoice.Document
  association [1] to ZJS_I_RAPCMaterial       as _Material on $projection.Material = _Material.Material
{
  key document            as Document,
  key pos_number          as PositionNumber,
      material            as Material,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      quantity            as Quantity,
      _Material.StockUnit as Unit,
      price               as Price,
      currency            as Currency,
      _Invoice

}
