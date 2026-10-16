@EndUserText.label: 'Custom entity for company names'
//@ObjectModel.query.implementedBy: 'ABAP:ZCLJS_CUST_CNAME_QUERY'
@ObjectModel.query.implementedBy: 'ABAP:ZCLJS_CUST_ENT_DT'
define root custom entity ZCJS_I_RAPCustomEntityCNames
{
      @UI.lineItem: [{ position: 10 }]
      @UI.selectionField: [{ position: 10 }]
  key CompanyName        : abap.char( 60 );
      @UI.lineItem: [{ position: 20 }]
      @UI.selectionField: [{ position: 20 }]
      Branch             : abap.char( 50 );
      @UI.lineItem: [{ position: 30, cssDefault.width: '55rem' }]
      @UI.selectionField: [{ position: 30 }]
      CompanyDescription : abap.char( 255 );
}
