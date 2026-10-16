@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root view for ZJP_RAP_BOOK table'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define root view entity ZCJS_I_RAP_BOOK 
    as select from zdjs_rap_book
{   
   key travel_id     as Travel_Id,
  key booking_id    as Booking_Id,
      booking_date  as Booking_Date,
      customer_id   as Customer_Id,
      carrier_id    as Carrier_Id,
      connection_id as Connection_Id,
      flight_date   as Flight_Date,
      flight_price  as Flight_Price,
      currency_code as Currency_Code
}
