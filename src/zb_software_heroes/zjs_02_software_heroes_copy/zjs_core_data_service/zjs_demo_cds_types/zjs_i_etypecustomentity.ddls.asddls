@EndUserText.label: 'Custom Entity'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_JS_DEMO_ETYPE_QUERY'
define custom entity ZJS_I_ETYPECUSTOMENTITY
{
  key uuid        : sysuuid_x16;
      description : abap.sstring( 350 );
      counter     : abap.int4;

}
