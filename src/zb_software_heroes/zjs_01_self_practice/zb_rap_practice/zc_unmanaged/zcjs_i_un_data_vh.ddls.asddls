@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help'
define view entity ZCJS_I_UN_DATA_VH as select from zdjs_un_data
{
    key gen_key as GenKey,
    text as Text,
    cdate as Cdate,
    last_changed as LastChanged
}
