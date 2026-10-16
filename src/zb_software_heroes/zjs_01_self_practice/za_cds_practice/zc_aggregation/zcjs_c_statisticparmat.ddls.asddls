@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Statistic for high Performer'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_StatisticParMat
  as select from ZCJS_C_PartnerMaterialSum   as Combine
    inner join   ZCJS_C_PARTNERMATERIALCOUNT as Numbers on  Combine.PartnerNumber  = Numbers.PartnerNumber
                                                        and Combine.MaterialNumber = Numbers.MaterialNumber

{
  key Combine.PartnerNumber,
  key Combine.MaterialNumber,
      Combine.ItemCurrency,
      @Semantics.amount.currencyCode: 'ItemCurrency'
      Combine.PriceForPartnerMaterial,
      Numbers.NumberOfDocuments
}

where
      Numbers.NumberOfDocuments       >= 10
  and Combine.PriceForPartnerMaterial <= 100000
