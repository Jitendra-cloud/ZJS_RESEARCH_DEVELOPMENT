@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Substring for month'
define view entity ZJS_C_DMOINVOICESUBSTRING
  as select from ZJS_I_DMOINVOICE
{
  key DocumentNumber,
      DocumentDate,
      substring( DocumentDate, 5, 2 ) as MonthInDocumentDate,
      PartnerNumber
}
