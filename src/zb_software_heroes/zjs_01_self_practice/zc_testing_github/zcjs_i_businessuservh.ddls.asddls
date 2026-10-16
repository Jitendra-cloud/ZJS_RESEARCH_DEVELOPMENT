@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Additional Informations'
define view entity ZCJS_I_BUSINESSUSERVH
  as select from zdjs_b_uservh
{
  key currency           as Currency,
      ccomment           as Ccomment,
      documentation      as Documentation,
      picture_url        as PictureUrl,
      last_editor        as UserID,
      last_editor        as PersonFullName,
      excel_attachment   as ExcelAttachment,
      excel_mimetype     as ExcelMimetype,
      excel_filename     as ExcelFilename,
      picture_attachment as PictureAttachment,
      picture_mimetype   as PictureMimetype,
      picture_filename   as PictureFilename,
      local_last_changed as LocalLastChanged,
      last_changed       as LastChanged
}
