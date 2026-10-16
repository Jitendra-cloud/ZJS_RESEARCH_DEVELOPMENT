@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: 'Sales'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZJS_GlobalSale'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZJS_C_SASALE
  provider contract transactional_query
  as projection on ZJS_R_SASALE
  association of exact one to one ZJS_R_SASALE as _BaseEntity on $projection.UUID = _BaseEntity.UUID
{
  key UUID,
      PartnerNumber,
      SalesDate,
      @Semantics: {
        amount.currencyCode: 'Salescurrency'
      }
      SalesVolume,
      SalesCurrency,
      @Semantics: {
        amount.currencyCode: 'Differencecurrency'
      }
      DifferenceAmount,
      DifferenceCurrency,
      @Semantics: {
        quantity.unitOfMeasure: 'Differenceunit'
      }
      DifferenceQuantity,
      DifferenceUnit,
      SaleComment,
      @Semantics: {
        user.createdBy: true
      }
      LocalCreatedBy,
      @Semantics: {
        systemDateTime.createdAt: true
      }
      LocalCreatedAt,
      @Semantics: {
        user.localInstanceLastChangedBy: true
      }
      LocalLastChangedBy,
      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      LocalLastChangedAt,
      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      LastChangedAt,
      _SAInfo   : redirected to composition child ZJS_C_SAINFO,
      _SASold   : redirected to composition child ZJS_C_SASOLD,
      _SASeller : redirected to composition child ZJS_C_SASELLER,
      _BaseEntity
}
