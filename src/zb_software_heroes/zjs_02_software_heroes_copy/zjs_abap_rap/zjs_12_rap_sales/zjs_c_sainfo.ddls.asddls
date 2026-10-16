@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: 'Generated'
}
@AccessControl.authorizationCheck: #MANDATORY
define view entity ZJS_C_SAINFO
  as projection on ZJS_R_SAINFO
  association of exact one to one ZJS_R_SAINFO as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
      ParentUUID,
      Language,
      TextInformation,
      _SASale : redirected to parent ZJS_C_SASALE,
      _BaseEntity
}
