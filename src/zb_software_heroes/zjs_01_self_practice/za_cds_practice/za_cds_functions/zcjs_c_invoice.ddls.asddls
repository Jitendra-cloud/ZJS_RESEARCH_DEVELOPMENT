@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SESSION + DATN_ADD_DAYS - Session Info'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
define view entity ZCJS_C_INVOICE
  as select from ZCJS_I_INVOICE
{
  key DocumentNumber,
      DocumentDate,
//      datn_add_days( cast( DocumentDate as abap.dats ) , cast( 255 as abap.int4 ) ) as DateAdded,
      dats_add_days( DocumentDate, 10, 'INITIAL' ) as NewDate,
      DocumentTime,
      PartnerNumber
}


where
  DocumentDate < $session.system_date //datn_add_days( $session.system_date, -255 )
  
 