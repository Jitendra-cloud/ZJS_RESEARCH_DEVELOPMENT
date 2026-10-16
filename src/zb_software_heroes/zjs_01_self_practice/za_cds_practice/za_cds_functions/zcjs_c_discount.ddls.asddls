@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CAST - Cast from number'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_DISCOUNT
  as select from ZCJS_I_DISCOUNT
{
  key PartnerNumber,
  key MaterialNumber,
      @Semantics.amount.currencyCode: 'Currency'
      DiscountValue,
      concat( cast(DiscountValue as abap.char( 10 )  ), '%' ) as NewCastedField,
      ZCJS_I_DISCOUNT._Material.Currency
      
}
