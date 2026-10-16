@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection'
@Metadata.allowExtensions: true
define root view entity ZJS_C_TRAVEL_U_CSN
  provider contract transactional_query
  as projection on ZJS_I_Travel_U_CSN
{
  key TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Memo,
      Status,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangeDateTime,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZJS_C_BOOKING_U_CSN,
      _Currency,
      _Customer,
      _TravelStatus
}
