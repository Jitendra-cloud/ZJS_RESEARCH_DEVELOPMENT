@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forDMOGen2P'
define view entity ZR_DMOGen2PTP
  as select from ZDJS_GEN2_ITEM as DMOGen2P
  association to parent ZR_DMOGen2H01TP as _DMOGen2H on $projection.UuidKey = _DMOGen2H.UuidKey
  composition [0..*] of ZCJS_R_GEN2SUBITEMTP as _DMOGen2S
{
  key UUID_POS as UuidPos,
  UUID_KEY as UuidKey,
  @Semantics.amount.currencyCode: 'Currency'
  PRICE as Price,
  CURRENCY as Currency,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED as LocalLastChanged,
  LAST_CHANGED as LastChanged,
  _DMOGen2S,
  _DMOGen2H
  
}
