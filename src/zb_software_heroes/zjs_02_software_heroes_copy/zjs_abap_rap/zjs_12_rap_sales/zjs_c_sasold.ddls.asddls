@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@AccessControl.authorizationCheck: #MANDATORY
define view entity ZJS_C_SASOLD
  as projection on ZJS_R_SASOLD
  association of exact one to one ZJS_R_SASOLD as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
      ParentUUID,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZJS_I_SAMaterialVH', element : 'MaterialId' } }]
      @ObjectModel.text.element: [ 'MaterialName' ]
      @UI.textArrangement: #TEXT_ONLY
      MaterialId,
      _Material.MaterialName,
      _SASale : redirected to parent ZJS_C_SASALE,
      _BaseEntity,
      _Material
}
