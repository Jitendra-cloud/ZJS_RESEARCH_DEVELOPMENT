@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for ZDJS_INVOICE'
//@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCJS_I_RAPCInvoice
  as select from zdjs_invoice
  composition [0..*] of ZCJS_I_RAPCItems as _Items
{
  key document as Document,
      doc_date as DocDate,
      doc_time as DocTime,
      partner  as Partner,
      _Items
}
