@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exit in CDS - Virtual Fields'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_PricePerUnit
  as select from ZCJS_I_ITEMS
  //association to ZCJS_I_MATERIAL as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key DocumentNumber,
  key ItemNumber,
      ZCJS_I_ITEMS._Material.MaterialName,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      ItemQuantity,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      ItemPrice,
      ItemCurrency,
      //MaterialNumber,
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCLJS_CDS_EXIT'
      @Semantics.amount.currencyCode: 'ItemCurrency'
      cast( 0 as abap.curr(15,2) ) as PricePerUnit,
      ZCJS_I_ITEMS._Material.StockUnit
}
