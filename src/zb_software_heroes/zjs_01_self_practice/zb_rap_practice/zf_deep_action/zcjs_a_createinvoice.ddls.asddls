@EndUserText.label: 'Create Invoice'
define root abstract entity ZCJS_A_CreateInvoice
{
  key DummyKey  : abap.char(1);
      Document  : abap.char(8);
      Partner   : abap.char(10);
      _Items : composition [0..*] of ZCJS_A_CreateItems;
    
}
