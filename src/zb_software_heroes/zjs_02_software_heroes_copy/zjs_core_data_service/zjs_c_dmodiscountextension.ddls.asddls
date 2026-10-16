@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Extension'
define view entity ZJS_C_DMODISCOUNTEXTENSION
  as select from ZJS_I_DMODISCOUNT
{
  key PartnerNumber,
  key MaterialNumber,
      DiscountValue,
      ZJS_I_DMODISCOUNT._Material.MaterialName,
      ZJS_I_DMODISCOUNT._Material.MaterialDescription
}
