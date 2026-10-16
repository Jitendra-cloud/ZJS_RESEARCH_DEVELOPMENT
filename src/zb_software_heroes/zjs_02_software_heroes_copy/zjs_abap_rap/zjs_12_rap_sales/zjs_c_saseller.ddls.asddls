@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@AccessControl.authorizationCheck: #MANDATORY
define view entity ZJS_C_SASELLER
  as projection on ZJS_R_SASELLER
  association of exact one to one ZJS_R_SASELLER as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
      ParentUUID,
      SellerId,
      Quota,
      Confirmed,
      _SASale : redirected to parent ZJS_C_SASALE,
      _BaseEntity
}
