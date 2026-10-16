@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Country Assignment'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZJS_C_DRPCURRENCYCOUNTRY
  as projection on ZJS_I_DRPCurrencyCountry
{
  key Currency,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CountryVH', element: 'Country' } }]
  key Country,
      CountryName,
      CountryRanking,
      _Currency : redirected to parent ZJS_C_DRPCurrency
}
