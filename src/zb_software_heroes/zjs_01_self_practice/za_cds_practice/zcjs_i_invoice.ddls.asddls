@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base view of Invoice table'
@VDM.viewType: #COMPOSITE
define view entity ZCJS_I_INVOICE
  as select from zdjs_invoice as Invoice
  association [0..*] to ZCJS_I_ITEMS   as _Items   on $projection.DocumentNumber = _Items.DocumentNumber
  association to ZCJS_I_PARTNER as _Partner on $projection.PartnerNumber = _Partner.PartnerNumber
{
  key document as DocumentNumber,
      doc_date as DocumentDate,
      doc_time as DocumentTime,
      partner  as PartnerNumber,
      _Partner,
      _Items
}
