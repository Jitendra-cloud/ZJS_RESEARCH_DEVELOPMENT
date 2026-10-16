@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Invoice with Type'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_I_InvoiceWithType
  as select from zdjs_invoice
{
  key document,
      doc_date,
      doc_time,
      partner,
      cast( 'C' as ZTJS_CDSInvoiceStatus preserving type ) as StatusSimpleType,
      ZTJS_CDSInvoiceStatusEnum.#Closed                    as StatusEnumTypeClosed,
      ZTJS_CDSInvoiceStatusEnum.#Payed                     as StatusEnumTypePlayed
}
