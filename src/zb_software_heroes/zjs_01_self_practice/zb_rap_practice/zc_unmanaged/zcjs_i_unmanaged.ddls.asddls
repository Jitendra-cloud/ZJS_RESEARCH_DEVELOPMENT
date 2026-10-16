@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unmanaged Root'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCJS_I_Unmanaged
  as select from zdjs_unmgnd
{
  key gen_key as TableKey,
      text    as Description,
      cdate   as CreationDate
}
