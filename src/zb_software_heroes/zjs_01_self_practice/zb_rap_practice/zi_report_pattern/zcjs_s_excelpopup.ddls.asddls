@EndUserText.label: 'Excel Popup'
define root abstract entity ZCJS_S_ExcelPopup
{
  @EndUserText.label: 'Comment'
  EventComment : abap.char(60);
  @EndUserText.label: 'Test run'
//  @UI.hidden: true
  TestRun      : abap_boolean;
//  @EndUserText.label: 'Test date'
//  TestRun2      : abap_boolean;

}
