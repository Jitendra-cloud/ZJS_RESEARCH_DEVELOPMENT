@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
@EndUserText.label: 'Consumption view for flight bookings'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZJS_C_FlightBooking
  provider contract transactional_query
  as projection on ZJS_I_FlightBooking
{
  key booking_id,
      customer_id,
      flight_no,
      booking_date,
      status,
      /* Associations */
      _Passengers : redirected to composition child ZJS_C_BOOKINGPASSENGER
}
