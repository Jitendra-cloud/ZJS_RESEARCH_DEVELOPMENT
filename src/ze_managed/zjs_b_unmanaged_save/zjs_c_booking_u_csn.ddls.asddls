@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection'
@Metadata.allowExtensions: true
define view entity ZJS_C_BOOKING_U_CSN
  as projection on ZJS_I_Booking_U_CSN
{
  key TravelID,
  key BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      /* Associations */
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZJS_C_TRAVEL_U_CSN
}
