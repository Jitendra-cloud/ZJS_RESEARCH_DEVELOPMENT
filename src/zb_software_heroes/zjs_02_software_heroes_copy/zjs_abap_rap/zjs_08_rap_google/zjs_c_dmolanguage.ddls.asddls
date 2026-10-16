@Metadata.allowExtensions: true
@EndUserText.label: 'Language (Projection)'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@ObjectModel.semanticKey: [ 'SourceLanguage', 'SourceText' ]
define root view entity ZJS_C_DMOLANGUAGE
  provider contract transactional_query
  as projection on ZJS_R_DMOLANGUAGE
{
  key Identification,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Language', element: 'LanguageISOCode' } }]
      SourceLanguage,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      SourceText,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Language', element: 'LanguageISOCode' } }]
      TargetLanguage,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      TargetText,
      LocalCreatedBy,
      LocalLastChangedBy,
      LocalLastChanged,
      LastChanged

}
