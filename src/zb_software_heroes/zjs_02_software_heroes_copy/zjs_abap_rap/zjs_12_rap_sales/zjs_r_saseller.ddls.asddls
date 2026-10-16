@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define view entity ZJS_R_SASELLER
  as select from zjs_saseller as SASeller
  association to parent ZJS_R_SASALE as _SASale on $projection.ParentUUID = _SASale.UUID
{
  key uuid        as UUID,
      parent_uuid as ParentUUID,
      sellerid    as SellerId,
      quota       as Quota,
      confirmed   as Confirmed,
      _SASale
}
