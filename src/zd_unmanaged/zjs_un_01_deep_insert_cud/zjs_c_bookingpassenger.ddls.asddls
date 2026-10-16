@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for flight bookings passengers'
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJS_C_BOOKINGPASSENGER
  as projection on ZJS_I_BookingPassenger
{
  key booking_id,
  key passenger_no,
      name,
      seat_no,
      ticket_status,
      /* Associations */
      _Flightbooking :  redirected to parent ZJS_C_FlightBooking
}
