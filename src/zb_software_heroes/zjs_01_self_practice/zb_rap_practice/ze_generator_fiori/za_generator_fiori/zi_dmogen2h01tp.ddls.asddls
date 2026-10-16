@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forDMOGen2H'
define root view entity ZI_DMOGen2H01TP
  provider contract TRANSACTIONAL_INTERFACE
  as projection on ZR_DMOGen2H01TP as DMOGen2H
{
  key UuidKey,
  Description,
  IsActive,
  LocalLastChanged,
  LastChanged,
  _DMOGen2P : redirected to composition child ZI_DMOGen2PTP
  
}
