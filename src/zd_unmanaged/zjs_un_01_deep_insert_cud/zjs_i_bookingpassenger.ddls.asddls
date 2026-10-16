@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view for booking passengers'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJS_I_BookingPassenger
  as select from zdjs_book_pass
  association to parent ZJS_I_FlightBooking as _Flightbooking on $projection.booking_id = _Flightbooking.booking_id

{
  key booking_id,
  key passenger_no,
      name,
      seat_no,
      ticket_status,
      _Flightbooking
}
