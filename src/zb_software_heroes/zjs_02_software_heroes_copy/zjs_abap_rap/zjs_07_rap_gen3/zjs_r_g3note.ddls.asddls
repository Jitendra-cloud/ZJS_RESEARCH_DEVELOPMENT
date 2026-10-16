@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define view entity ZJS_R_G3NOTE
  as select from ZJS_G3NOTE as G3Note
  association        to parent ZJS_R_G3POSITION as _G3Position on $projection.ParentUuid = _G3Position.Uuid
  association [1..1] to ZJS_R_G3HEADER          as _G3Header   on $projection.RootUuid = _G3Header.Uuid
{
  key uuid            as Uuid,
      parent_uuid     as ParentUuid,
      root_uuid       as RootUuid,
      additional_note as AdditionalNote,
      _G3Position,
      _G3Header

}
