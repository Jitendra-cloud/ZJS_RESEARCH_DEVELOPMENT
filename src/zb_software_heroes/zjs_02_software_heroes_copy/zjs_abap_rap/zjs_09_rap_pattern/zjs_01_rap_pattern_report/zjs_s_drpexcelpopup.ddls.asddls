@EndUserText.label: 'Excel Popup'
define root abstract entity ZJS_S_DRPEXCELPOPUP
{
  @EndUserText.label: 'Comment'
  EventComment : abap.char(60);
  @EndUserText.label: 'Test run'
  TestRun      : abap_boolean;
}
