@EndUserText.label: 'Create Invoice'
define root abstract entity ZJS_S_RAPCREATEINVOICE
{
  key DummyKey  : abap.char(1);
      Document  : abap.char(8);
      Partner   : abap.char(10);
      _Position : composition [0..*] of ZJS_S_RAPCreatePosition;
}
