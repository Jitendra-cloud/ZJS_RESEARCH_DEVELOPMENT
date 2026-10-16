@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for ZJS_DMO_INVOICE'
define root view entity ZJS_R_RAPCINVOICE
  as select from zjs_dmo_invoice
  composition [0..*] of ZJS_I_RAPCPOSITION as _Position
{
  key document as Document,
      doc_date as DocDate,
      doc_time as DocTime,
      partner  as Partner,
      _Position
}
