@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@ObjectModel.semanticKey: [ 'SourceLanguage', 'SourceText' ]
define root view entity ZC_DJS_LANG
  provider contract transactional_query
  as projection on ZR_DJS_LANG
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
