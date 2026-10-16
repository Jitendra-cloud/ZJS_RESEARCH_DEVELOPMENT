@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country Assignment'
define view entity ZCJS_B_CURRENCYCOUNTRY
  as select from zdjs_country
{
  key currency as Currency,
  key country  as Country,
      ranking  as CountryRanking
}
