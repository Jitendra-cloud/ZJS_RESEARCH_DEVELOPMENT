@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Complete Invoice Document'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #COMPOSITE
define view entity ZCJS_I_CompleteDocument
  as select from ZCJS_I_ITEMS   as ITEM
    inner join   ZCJS_I_INVOICE as HEAD    on HEAD.DocumentNumber = ITEM.DocumentNumber
    inner join   ZCJS_I_PARTNER as Partner on Partner.PartnerNumber = HEAD.PartnerNumber
{
  key ITEM.DocumentNumber,
  key ITEM.ItemNumber,
      HEAD.PartnerNumber,
      Partner.PartnerName,
      Partner.City,
      Partner.Country,
      ITEM.MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'StockUnit'
      ITEM.ItemQuantity,
      @Semantics.amount.currencyCode: 'ItemCurrency' 
ITEM.ItemPrice,
      ITEM.ItemCurrency,
      HEAD.DocumentDate,
      ITEM._Material.StockUnit
}
