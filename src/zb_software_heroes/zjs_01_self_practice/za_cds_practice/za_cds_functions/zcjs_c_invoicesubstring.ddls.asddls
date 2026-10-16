@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SUBSTRING - Substring for month'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_InvoiceSubstring as select from ZCJS_I_INVOICE
{
    key DocumentNumber,
    DocumentDate,
    PartnerNumber,
    substring( DocumentDate, 5, 2 ) as DocumentMonth
}
