@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View For ''ZDJS_CNAME'''
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCJS_I_CNAME as select from zdjs_cname
{
    key name as CompanyName,
    branch as Branch,
    description as CompanyDescription
}
