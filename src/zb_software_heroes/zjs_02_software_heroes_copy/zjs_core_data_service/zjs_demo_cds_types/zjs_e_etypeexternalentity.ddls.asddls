@EndUserText.label: 'External Entity'
define external entity ZJS_E_ETYPEEXTERNALENTITY external name BUT000
{
  key BusinessPartner : abap.char(10) external name PARTNER;
      Type            : abap.char(1)  external name TYPE;
      BPEXT           : abap.char(20);
      BU_SORT1        : abap.char(20);
      BU_SORT2        : abap.char(20);
}
with federated data provided at runtime
