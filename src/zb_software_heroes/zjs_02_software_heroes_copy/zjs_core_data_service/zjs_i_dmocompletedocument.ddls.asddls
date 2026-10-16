@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Complete Invoice Document'
define view entity ZJS_I_DMOCOMPLETEDOCUMENT
  as select from ZJS_I_DMOPOSITION as Position
    inner join   ZJS_I_DMOINVOICE  as Head    on Head.DocumentNumber = Position.DocumentNumber
    inner join   ZJS_I_DMOPARTNER  as Partner on Partner.PartnerNumber = Head.PartnerNumber
{
  key Position.DocumentNumber,
  key Position.PositionNumber,
      Head.PartnerNumber,
      Partner.PartnerName,
      Partner.City,
      Partner.Country,
      Position.MaterialNumber,
      @Semantics.quantity.unitOfMeasure: 'PositionUnit'
      Position.PositionQuantity,
      Position.PositionUnit,
      @Semantics.amount.currencyCode: 'PositionCurrency'
      Position.PositionPrice,
      Position.PositionCurrency,
      Head.DocumentDate
}
