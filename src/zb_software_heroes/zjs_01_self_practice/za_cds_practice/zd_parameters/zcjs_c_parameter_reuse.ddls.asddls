@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'REUSE - Parameter Reuse'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_PARAMETER_REUSE
  as select from ZCJS_C_PARAMETER( P_Date:'20240410' , P_Type:'A' , P_Field: 'HELLO'  )
{
  key DocumentNumber,
      DocumentDate,
      PartnerName,
      Status,
      ImportedField
}
