@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Discount'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_I_RapDiscount
  as select from zdjs_discount
{
  key partner  as PartnerNumber,
  key material as MaterialNumber,
      discount as DiscountValue
}
