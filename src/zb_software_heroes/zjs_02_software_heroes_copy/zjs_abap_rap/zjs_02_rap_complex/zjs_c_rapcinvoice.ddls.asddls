@EndUserText.label: 'Consumption for ZJS_R_RAPCINVOICE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@Search.searchable: true
define root view entity ZJS_C_RAPCINVOICE
  provider contract transactional_query
  as projection on ZJS_R_RAPCINVOICE as Invoice
{
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 1.0
  key     Document,
          DocDate,
          DocTime,
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          Partner,
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_JS_DEMO_CRAP_VE_EXIT'
  virtual NumberOfPositions : abap.int4,
          _Position : redirected to composition child ZJS_C_RAPCPOSITION
}
