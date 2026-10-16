@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Country Assignment'
@Metadata.allowExtensions: true
define view entity ZCJS_C_CurrencyCountry
  as projection on ZCJS_I_CurrencyCountry
{
  key Currency,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CountryVH', element: 'Country' } }]
  key Country,
      CountryName,
      CountryRanking,
      _Currency : redirected to parent ZCJS_C_Currency
}
