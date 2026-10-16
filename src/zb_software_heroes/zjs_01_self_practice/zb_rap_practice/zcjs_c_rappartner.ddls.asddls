@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View For Partner'
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define root view entity ZCJS_C_RapPartner
  provider contract transactional_query
  as projection on ZCJS_I_RapPartner
{
  key PartnerNumber,
      PartnerName,
      Street,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZCJS_I_RAPCityVH', element: 'City' } }]
      City,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZCJS_C_CountryVH', element: 'Country' } }]
      Country,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      PaymentCurrency,
      LastChangedAt,
      LastChangedBy,
      CreatedAt,
      CreatedBy
}
