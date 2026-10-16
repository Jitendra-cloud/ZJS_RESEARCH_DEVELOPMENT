@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Items'
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_I_RapItems
  as select from zdjs_items
{
  key document   as DocumentNumber,
  key pos_number as ItemNumber,
      material   as MaterialNumber,
//      quantity   as ItemQuantity,
      price      as ItemPrice,
      currency   as ItemCurrency
}
