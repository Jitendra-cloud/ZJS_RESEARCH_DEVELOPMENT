@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forDMOGen2S'
define view entity ZCJS_R_GEN2SUBITEMTP
  as select from ZDJS_GEN2_SITEM as DMOGen2S
  association to parent ZR_DMOGen2PTP as _DMOGen2P on $projection.UuidPos = _DMOGen2P.UuidPos
  association [1] to ZR_DMOGen2H01TP as _DMOGen2H on $projection.UuidKey = _DMOGen2H.UuidKey
{
  key UUID_SUB_POS as UuidSubPos,
  UUID_KEY as UuidKey,
  UUID_POS as UuidPos,
  DESCRIPTION as Description,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED as LocalLastChanged,
  LAST_CHANGED as LastChanged,
  _DMOGen2P,
  _DMOGen2H
  
}
