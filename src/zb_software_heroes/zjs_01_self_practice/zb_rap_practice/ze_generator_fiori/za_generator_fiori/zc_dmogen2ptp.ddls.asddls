@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forDMOGen2P'
@ObjectModel.semanticKey: [ 'UuidPos' ]
@Search.searchable: true
define view entity ZC_DMOGen2PTP
  as projection on ZR_DMOGen2PTP as DMOGen2P
{
  key UuidPos,
  UuidKey,
  @Semantics.amount.currencyCode: 'Currency'
  Price,
  @Consumption.valueHelpDefinition: [ {
    entity: {
      name: 'I_Currency', 
      element: 'Currency'
    }, 
    useForValidation: true
  } ]
  Currency,
  LocalLastChanged,
  LastChanged,
  _DMOGen2S : redirected to composition child ZCJS_C_GEN2SUBITEMTP,
  _DMOGen2H : redirected to parent ZC_DMOGen2H01TP
  
}
