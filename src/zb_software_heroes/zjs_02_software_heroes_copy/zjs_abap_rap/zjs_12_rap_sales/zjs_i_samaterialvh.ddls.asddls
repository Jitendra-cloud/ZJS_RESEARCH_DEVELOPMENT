@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Value Help'
@Search.searchable: true
define view entity ZJS_I_SAMATERIALVH
  as select from zjs_dmo_material
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 1.0
      @ObjectModel.text.element: [ 'MaterialName' ]
      @UI.textArrangement: #TEXT_ONLY
  key material as MaterialId,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      name     as MaterialName
}
