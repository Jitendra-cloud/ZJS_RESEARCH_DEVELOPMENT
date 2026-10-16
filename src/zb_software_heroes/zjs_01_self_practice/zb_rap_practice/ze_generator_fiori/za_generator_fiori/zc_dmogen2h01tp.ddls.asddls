@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forDMOGen2H'
@ObjectModel.semanticKey: [ 'UuidKey' ]
@Search.searchable: true
define root view entity ZC_DMOGen2H01TP
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_DMOGen2H01TP as DMOGen2H
{
  key UuidKey,
  Description,
  IsActive,
  LocalLastChanged,
  LastChanged,
  _DMOGen2P : redirected to composition child ZC_DMOGen2PTP
  
}
