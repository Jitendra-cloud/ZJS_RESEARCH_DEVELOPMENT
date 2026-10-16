@AccessControl.authorizationCheck:  #NOT_REQUIRED
@EndUserText.label: 'Reuse with parameters'
define view entity ZJS_C_DMOPARAMETERREUSE
  with parameters
    P_Date : abap.dats
  as select from ZJS_C_DMOPARAMETER(
                 P_Date : $parameters.P_Date,
                 P_Type : 'A',
                 P_Field : 'From Outer'
                 )
{
  key DocumentNumber,
      DocumentDate,
      Status,
      ImportedField
}
