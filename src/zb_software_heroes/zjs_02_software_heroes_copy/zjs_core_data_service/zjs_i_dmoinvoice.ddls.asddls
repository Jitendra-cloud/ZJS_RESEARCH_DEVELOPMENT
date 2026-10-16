@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Invoice'
define view entity ZJS_I_DMOINVOICE
  as select from zjs_dmo_invoice as Invoice
  association [0..*] to ZJS_I_DMOPOSITION as _Position on $projection.DocumentNumber = _Position.DocumentNumber
  association [0..1] to ZJS_I_DMOPARTNER  as _Partner  on $projection.PartnerNumber = _Partner.PartnerNumber
{
  key document as DocumentNumber,
      doc_date as DocumentDate,
      doc_time as DocumentTime,
      partner  as PartnerNumber,
      _Position,
      _Partner
}
