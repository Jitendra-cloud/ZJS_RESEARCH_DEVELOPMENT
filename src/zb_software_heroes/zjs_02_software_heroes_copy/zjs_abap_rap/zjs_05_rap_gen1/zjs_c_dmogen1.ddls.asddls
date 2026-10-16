@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZJS_R_DMOGEN1'
@ObjectModel.semanticKey: [ 'UuidKey' ]
define root view entity ZJS_C_DMOGEN1
  provider contract transactional_query
  as projection on ZJS_R_DMOGEN1
{
  key UuidKey,
  Description,
  Price,
  Currency,
  LocalLastChanged
  
}
