@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #CHECK
define view entity ZJS_C_G3POSITION
  as projection on ZJS_R_G3POSITION
{
  key Uuid,
      ParentUuid,
      PositionNumber,
      PositionText,
      Amount,
      @Semantics.currencyCode: true
      Currency,
      _G3Note   : redirected to composition child ZJS_C_G3NOTE,
      _G3Header : redirected to parent ZJS_C_G3HEADER

}
