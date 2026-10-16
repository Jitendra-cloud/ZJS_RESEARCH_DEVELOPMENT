@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forDMOGen2S'
define view entity ZCJS_I_GEN2SUBITEMTP
  as projection on ZCJS_R_GEN2SUBITEMTP as DMOGen2S
{
  key UuidSubPos,
  UuidKey,
  UuidPos,
  Description,
  LocalLastChanged,
  LastChanged,
  _DMOGen2P : redirected to parent ZI_DMOGen2PTP,
  _DMOGen2H : redirected to ZI_DMOGen2H01TP
  
}
