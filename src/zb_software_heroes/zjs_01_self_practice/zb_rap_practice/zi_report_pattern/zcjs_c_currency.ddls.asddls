@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Currency'
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'Currency' ]
define root view entity ZCJS_C_Currency
  provider contract transactional_query
  as projection on ZCJS_R_Currency
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 1.0
      @Search.ranking: #HIGH
  key Currency,
      Decimals,
      CurrencyISOCode,
      AlternativeCurrencyKey,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Search.ranking: #MEDIUM
      CurrencyName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #MEDIUM
      CurrencyShortName,
      CurrencyComment,
      Documentation,
      PictureURL,

      @Semantics.largeObject: { mimeType : 'ExcelMimetype',
                                fileName : 'ExcelFilename',
                                contentDispositionPreference: #INLINE,
                                acceptableMimeTypes: [ 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ] }
      ExcelAttachement,
      @Semantics.mimeType: true
      ExcelMimetype,
      ExcelFilename,
      @Semantics.largeObject: { mimeType : 'PictureMimetype',
                                fileName : 'PictureFilename',
                                contentDispositionPreference: #INLINE,
                                acceptableMimeTypes: [ 'image/*' ] }
      PictureAttachement,
      @Semantics.mimeType: true
      PictureMimetype,
      PictureFilename,

      LastEditor,
      _User.PersonFullName as EditorName,
      _Country : redirected to composition child ZCJS_C_CurrencyCountry
}
