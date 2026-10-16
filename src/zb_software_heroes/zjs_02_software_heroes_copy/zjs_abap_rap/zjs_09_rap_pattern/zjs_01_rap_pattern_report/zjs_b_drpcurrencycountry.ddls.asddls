@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country Assignment'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJS_B_DRPCURRENCYCOUNTRY
  as select from zjs_drp_country
{
  key currency as Currency,
  key country  as Country,
      ranking  as CountryRanking
}
