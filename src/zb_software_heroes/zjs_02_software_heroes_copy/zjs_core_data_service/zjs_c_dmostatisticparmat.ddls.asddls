@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Statistic for high performer'
define view entity ZJS_C_DMOSTATISTICPARMAT
  as select from ZJS_C_DMOPARTNERMATERIALSUM   as Combine
    inner join   ZJS_C_DMOPARTNERMATERIALCOUNT as Numbers on  Combine.PartnerNumber  = Numbers.PartnerNumber
                                                          and Combine.MaterialNumber = Numbers.MaterialNumber
{
  key Combine.PartnerNumber,
  key Combine.MaterialNumber,
      Combine.PositionCurrency,
      @Semantics.amount.currencyCode: 'POSITIONCURRENCY'
      Combine.PriceForPartnerMaterial,
      Numbers.NumberOfDocuments
}
where
      Numbers.NumberOfDocuments       >= 10
  and Combine.PriceForPartnerMaterial <= 100000
