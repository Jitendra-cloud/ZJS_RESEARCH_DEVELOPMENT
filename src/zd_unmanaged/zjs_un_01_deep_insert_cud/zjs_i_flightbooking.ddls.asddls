@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Bookings'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZJS_I_FlightBooking
  as select from zdjs_booking_hdr
  composition [1..*] of  ZJS_I_BookingPassenger as _Passengers
{
  key booking_id,
      customer_id,
      flight_no,
      booking_date,
      status,
      _Passengers
}
