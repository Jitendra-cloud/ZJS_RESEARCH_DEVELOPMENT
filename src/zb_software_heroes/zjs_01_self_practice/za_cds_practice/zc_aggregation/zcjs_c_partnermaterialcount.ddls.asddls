@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Count for Partner and Material'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_PARTNERMATERIALCOUNT
  as select from ZCJS_I_ITEMS
{
  key ZCJS_I_ITEMS._Invoice.PartnerNumber,
  key MaterialNumber,
      count( * ) as NumberOfDocuments
}
group by
  ZCJS_I_ITEMS._Invoice.PartnerNumber,
  MaterialNumber
