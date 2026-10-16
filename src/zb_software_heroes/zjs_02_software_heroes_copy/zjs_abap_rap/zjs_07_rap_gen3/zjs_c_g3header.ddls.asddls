@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@ObjectModel.semanticKey: [ 'DocumentId' ]
@AccessControl.authorizationCheck: #CHECK
@ObjectModel.sapObjectNodeType.name: 'ZJS_G3Invoice'
define root view entity ZJS_C_G3HEADER
  provider contract transactional_query
  as projection on ZJS_R_G3HEADER
{
  key Uuid,
      DocumentId,
      CustomerNumber,
      Description,
      LocalCreatedBy,
      LocalCreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      _G3Position : redirected to composition child ZJS_C_G3POSITION

}
