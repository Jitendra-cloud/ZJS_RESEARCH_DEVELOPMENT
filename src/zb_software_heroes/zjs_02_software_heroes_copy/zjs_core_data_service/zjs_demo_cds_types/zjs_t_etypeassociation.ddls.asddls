@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Table Entity Association'
define table entity ZJS_T_ETYPEASSOCIATION
{
  key ForeignKey  : abap.char( 10 );
      Description : abap.char( 60 );
}
