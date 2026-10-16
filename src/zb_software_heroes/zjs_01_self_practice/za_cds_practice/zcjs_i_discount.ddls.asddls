@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base view of Discount table'
@VDM.viewType: #COMPOSITE
define view entity ZCJS_I_DISCOUNT
  as select from zdjs_discount
  association [0..1] to ZCJS_I_PARTNER  as _Partner  on $projection.PartnerNumber = _Partner.PartnerNumber
  association [0..1] to ZCJS_I_MATERIAL as _Material on $projection.MaterialNumber = _Material.MaterialNumber
{
  key partner  as PartnerNumber,
  key material as MaterialNumber,
      discount as DiscountValue,
      _Partner,
      _Material
}
