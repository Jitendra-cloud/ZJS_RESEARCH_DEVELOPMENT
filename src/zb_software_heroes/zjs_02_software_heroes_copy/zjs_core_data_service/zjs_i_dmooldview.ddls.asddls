@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Old view type'
define view entity ZJS_I_DMOOLDVIEW
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    P_Date : abap.dats
  as select from zjs_dmo_invoice
  association [0..*] to ZJS_I_DMOPOSITION as _Position on $projection.DocumentNumber = _Position.DocumentNumber
{
  key document as DocumentNumber,
      doc_date as DocumentDate,
      doc_time as DocumentTime,
      partner  as PartnerNumber,
      _Position
}
where
  doc_date = $parameters.P_Date
