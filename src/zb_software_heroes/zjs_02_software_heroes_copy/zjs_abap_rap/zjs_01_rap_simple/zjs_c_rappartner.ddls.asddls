@EndUserText.label: 'RAP consumption for partner'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZJS_C_RAPPARTNER
  provider contract transactional_query
  as projection on ZJS_I_RAPPARTNER
{
  key PartnerNumber,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZJS_I_RAPCustomEntityCNames', element: 'CompanyName' } }]
      PartnerName,
      Street,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZJS_I_RAPCityVH', element: 'City' } }]
      City,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZJS_C_CountryVH', element: 'Country' } }]
      Country,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      PaymentCurrency,
      LastChangedAt,
      LastChangedBy,
      CreatedAt,
      CreatedBy,
      LocalLastChangedAt
}
