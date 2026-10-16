@EndUserText.label: 'Travel View Entity for Draft RefScen'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define root view entity ZJS_R_TRAVEL_PARAM

with parameters p_pbf : abap_boolean 

  as select from    /dmo/a_travel_d as a


    left outer join /dmo/travel_m   as b on a.travel_id   = b.travel_id
                                         and(
                                           b.travel_id    = '00000002'
                                           or b.travel_id = '00000003'
                                         )


  association [0..1] to /DMO/I_Agency            as _Agency        on $projection.AgencyID = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.OverallStatus = _OverallStatus.OverallStatus
  association [0..1] to I_Currency               as _Currency      on $projection.CurrencyCode = _Currency.Currency



{
  key a.travel_uuid           as TravelUUID,

      a.travel_id             as TravelID,
      a.agency_id             as AgencyID,
      a.customer_id           as CustomerID,
      a.begin_date            as BeginDate,
      a.end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      a.booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      a.total_price           as TotalPrice,
      a.currency_code         as CurrencyCode,
      a.description           as Description,
      a.overall_status        as OverallStatus,

      @Semantics.user.createdBy: true
      a.local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt: true
      a.local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      a.local_last_changed_by as LocalLastChangedBy,
      //local ETag field --> OData ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      a.local_last_changed_at as LocalLastChangedAt,

      //total ETag field
      @Semantics.systemDateTime.lastChangedAt: true
      a.last_changed_at       as LastChangedAt,

      //Associations

      _Agency,
      _Customer,
      _OverallStatus,
      _Currency
}

where
  b.travel_id is null
