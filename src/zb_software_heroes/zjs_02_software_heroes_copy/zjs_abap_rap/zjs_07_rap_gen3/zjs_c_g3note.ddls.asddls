@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define view entity ZJS_C_G3NOTE
  as projection on ZJS_R_G3NOTE
{
  key Uuid,
      ParentUuid,
      RootUuid,
      AdditionalNote,
      _G3Position : redirected to parent ZJS_C_G3POSITION,
      _G3Header   : redirected to ZJS_C_G3HEADER

}
