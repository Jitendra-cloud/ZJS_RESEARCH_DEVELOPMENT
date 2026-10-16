@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cast from number'
define view entity ZJS_C_DMODICOUNTCAST
  as select from ZJS_I_DMODISCOUNT
{
  key PartnerNumber,
  key MaterialNumber,
      DiscountValue,
      concat( cast( DiscountValue as abap.char(15) ), ' %' ) as DiscountText
}
