@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country Assignment'
define view entity ZCJS_I_CurrencyCountry
  as select from ZCJS_B_CURRENCYCOUNTRY
  association        to parent ZCJS_R_Currency as _Currency on _Currency.Currency = $projection.Currency
  association of one to one I_Country          as _Country  on _Country.Country = $projection.Country

{
  key Currency,
  key Country,
      _Country._Text[ Language = $session.system_language ].CountryName,
      CountryRanking,
      _Currency
}
