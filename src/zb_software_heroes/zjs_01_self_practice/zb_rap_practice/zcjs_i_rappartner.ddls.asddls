@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for Partner'
@Metadata.allowExtensions: true
@VDM.viewType:  #BASIC
define root view entity ZCJS_I_RapPartner
  as select from zdjs_partner
{

  key partner          as PartnerNumber,
      name             as PartnerName,
      street           as Street,
      city             as City,
      country          as Country,
      payment_currency as PaymentCurrency,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at  as LastChangedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by  as LastChangedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at       as CreatedAt,
      @Semantics.user.createdBy: true
      created_by       as CreatedBy
}
