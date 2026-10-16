@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Additional Information'
//@Metadata.ignorePropagatedAnnotations: true
define view entity ZCJS_B_ADDITIONALCURRENCY
  as select from zdjs_addcurr
{
  key currency           as Currency,
      ccomment           as CurrencyComment,
      documentation      as Documentation,
      picture_url        as PictureURL,
      last_editor        as LastEditor,

      excel_attachment   as ExcelAttachement,
      excel_mimetype     as ExcelMimetype,
      excel_filename     as ExcelFilename,
      picture_attachment as PictureAttachement,
      picture_mimetype   as PictureMimetype,
      picture_filename   as PictureFilename,

      local_last_changed as LocalLastChanged,
      last_changed       as LastChanged
}
