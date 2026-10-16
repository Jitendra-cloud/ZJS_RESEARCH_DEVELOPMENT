@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Currency Conversion'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_PartnerReporting
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_CalculationDate : abap.dats
  as select from ZCJS_C_PARTNERSUM
{
  key PartnerNumber,
      ItemCurrency,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      PriceForPartnerMaterial,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      currency_conversion( amount => PriceForPartnerMaterial,
                           source_currency => ItemCurrency,
                           round => 'X',
                           target_currency => cast( 'USD' as abap.cuky( 5 ) ),
                           exchange_rate_date => $parameters.P_CalculationDate,
                           exchange_rate_type => 'M',
                           error_handling => 'SET_TO_NULL'
                          ) as PriceInUSD
}
