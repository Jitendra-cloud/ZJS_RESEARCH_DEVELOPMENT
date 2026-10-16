@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forDMOGen2H'
define root view entity ZR_DMOGen2H01TP
  as select from ZDJS_GEN2_HEADER as DMOGen2H
  composition [0..*] of ZR_DMOGen2PTP as _DMOGen2P
{
  key UUID_KEY as UuidKey,
  DESCRIPTION as Description,
  IS_ACTIVE as IsActive,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED as LocalLastChanged,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED as LastChanged,
  _DMOGen2P
  
}
