@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Table Entity'
define table entity ZJS_T_ETYPETABLEENTITY
{
  key MyUUID          : sysuuid_x16;
      SemanticKey     : abap.char( 15 );
      LongDescription : abap.string null;
      ForeignKey      : abap.char( 10 );

      _KeyAsso        : association of exact one to one ZJS_T_ETYPEASSOCIATION on _KeyAsso.ForeignKey = $projection.ForeignKey;
}
