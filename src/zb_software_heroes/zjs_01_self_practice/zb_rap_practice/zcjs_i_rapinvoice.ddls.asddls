@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Invoice'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_I_RapInvoice
  as select from zdjs_invoice
{
  key document as DocumentNumber,
      doc_date as DocumentDate,
      doc_time as DocumentTime,
      partner  as PartnerNumber
}
