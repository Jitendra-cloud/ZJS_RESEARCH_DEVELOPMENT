@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sum of Partners'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_PARTNERSUM
  as select from ZCJS_I_ITEMS
{
  key ZCJS_I_ITEMS._Invoice.PartnerNumber,
      ItemCurrency,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      sum ( ItemPrice ) as PriceForPartnerMaterial

}
group by
  ZCJS_I_ITEMS._Invoice.PartnerNumber,
  ItemCurrency
