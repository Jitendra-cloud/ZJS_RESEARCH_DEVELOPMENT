@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forDMOGen2S'
@ObjectModel.semanticKey: [ 'UuidSubPos' ]
@Search.searchable: true
define view entity ZCJS_C_GEN2SUBITEMTP
  as projection on ZCJS_R_GEN2SUBITEMTP as DMOGen2S
{
  key UuidSubPos,
  UuidKey,
  UuidPos,
  Description,
  LocalLastChanged,
  LastChanged,
  _DMOGen2P : redirected to parent ZC_DMOGen2PTP,
  _DMOGen2H : redirected to ZC_DMOGen2H01TP
  
}
