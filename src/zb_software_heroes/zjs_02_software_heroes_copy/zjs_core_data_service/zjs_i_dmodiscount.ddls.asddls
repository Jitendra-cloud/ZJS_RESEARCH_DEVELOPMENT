@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Discount'
define view entity ZJS_I_DMODISCOUNT
  as select from zjs_dmo_discount
  association [0..1] to ZJS_I_DMOPARTNER  as _Partner  on $projection.PartnerNumber = _Partner.PartnerNumber
  association [0..1] to ZJS_I_DMOMATERIAL as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key partner  as PartnerNumber,
  key material as MaterialNumber,
      discount as DiscountValue,
      _Partner,
      _Material
}
