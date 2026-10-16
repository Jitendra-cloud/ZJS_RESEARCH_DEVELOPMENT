CLASS lhc_ZCJS_I_RAP_BOOK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zcjs_i_rap_book RESULT result.

ENDCLASS.

CLASS lhc_ZCJS_I_RAP_BOOK IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
