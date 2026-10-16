@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption Invoice'
@Metadata.allowExtensions: true
define root view entity ZJS_C_CDSPATTERNINVOICE
  provider contract transactional_query
  as projection on ZJS_T_CDSPatternInvoice
{
  key DocumentNumber,
      DocumentDate,
      DocumentTime,
      PartnerNumber,
      _Position : redirected to composition child ZJS_C_CDSPatternPosition
}
