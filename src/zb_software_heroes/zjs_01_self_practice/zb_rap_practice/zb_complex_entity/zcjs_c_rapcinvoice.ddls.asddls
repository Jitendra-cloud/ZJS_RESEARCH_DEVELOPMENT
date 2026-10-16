@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for ZCJS_I_RAPCInvoice'
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZCJS_C_RAPCInvoice
  provider contract transactional_query
  as projection on ZCJS_I_RAPCInvoice as Invoice
{
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 1.0
  key     Document,
          DocDate,
          DocTime,
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          Partner,
          _Items : redirected to composition child ZCJS_C_RAPCItems,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCLJS_VIRTUAL_INVOICE'
  virtual NumberOfPositions : abap.int4
}
