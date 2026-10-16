@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forDMOGen2P'
define view entity ZI_DMOGen2PTP
  as projection on ZR_DMOGen2PTP as DMOGen2P
{
  key UuidPos,
  UuidKey,
  Price,
  Currency,
  LocalLastChanged,
  LastChanged,
  _DMOGen2S : redirected to composition child ZCJS_I_GEN2SUBITEMTP,
  _DMOGen2H : redirected to parent ZI_DMOGen2H01TP
  
}
