@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS with Parameter'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_PARAMETER
  with parameters
    //@Environment.systemField: #SYSTEM_DATE
    P_Date  : abap.dats,
    P_Type  : abap.char(1),
    P_Field : abap.char(10)
  as select from ZCJS_I_INVOICE
{
  key DocumentNumber,
      DocumentDate,
      ZCJS_I_INVOICE._Partner.PartnerName,
      ZCJS_I_INVOICE._Partner.Country,
      case $parameters.P_Type
        when 'A' then 'New'
        when 'B' then 'Old'
        else 'Unknown'
      end                  as Status,
      $parameters.P_Field  as ImportedField,

      $session.system_date as SessionSystemDate
}
where
  DocumentDate < $parameters.P_Date
