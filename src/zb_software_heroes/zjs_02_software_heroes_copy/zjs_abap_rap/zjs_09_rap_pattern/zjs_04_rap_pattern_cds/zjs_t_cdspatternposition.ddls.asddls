@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS-P: Position'
define table entity ZJS_T_CDSPATTERNPOSITION
{
  key DocumentNumber   : abap.char(8);
  key PositionNumber   : abap.int2;
      MaterialNumber   : abap.char(5);
      @Semantics.quantity.unitOfMeasure : 'PositionUnit'
      PositionQuantity : abap.quan(10,0);
      PositionUnit     : abap.unit(3);
      @Semantics.amount.currencyCode : 'PositionCurrency'
      PositionPrice    : abap.curr(15,2);
      PositionCurrency : abap.cuky;
      
      _Document : association to parent zjs_t_cdspatterninvoice on _Document.documentnumber = $projection.DocumentNumber;
}
