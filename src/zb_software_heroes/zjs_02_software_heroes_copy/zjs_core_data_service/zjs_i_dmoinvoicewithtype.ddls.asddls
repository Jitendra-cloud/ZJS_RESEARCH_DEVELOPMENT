@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice with Types'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZJS_I_DMOINVOICEWITHTYPE
  as select from zjs_dmo_invoice
{
  key document                                                as Document,
      doc_date                                                as DocumentDate,
      doc_time                                                as DocumentTime,
      partner                                                 as PartnerNumber,
      cast( 'C' as ZJS_DEMOCDSINVOICESTATUS preserving type ) as StatusSimpleType,
      ZJS_DEMOCDSINVOICESTATUSENUM.#Payed                     as StatusEnumType
}
