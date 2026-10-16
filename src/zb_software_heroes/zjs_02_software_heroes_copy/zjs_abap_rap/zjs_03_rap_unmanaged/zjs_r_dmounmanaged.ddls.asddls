@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unmanaged Root'
define root view entity ZJS_R_DMOUNMANAGED
  as select from zjs_dmo_unmgnd
{
  key gen_key as TableKey,
      text    as Description,
      cdate   as CreationDate
}
