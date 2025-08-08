*&---------------------------------------------------------------------*
*& Report ZSTRING_0PE
*&---------------------------------------------------------------------*
*---------------------------------------------------------------------*
* Program Name: ZSTRING_0PE
* Description:  Demonstrates string splitting in ABAP
* Author:       Prawin Kumar Mandal
* Date:         Aug 2025
*---------------------------------------------------------------------*
REPORT ZSTRING_0PE.

DATA: lv_val1 TYPE char20 VALUE 'MY FAVOURITE',
      lv_val2 TYPE char30 VALUE 'subject is abap',
      lv_res  TYPE char60,
      lv_val3 TYPE char10,
      lv_val4 TYPE char10,
      lv_val5 TYPE char10.

" Split the string lv_val2 into three parts based on space
SPLIT lv_val2 AT space INTO lv_val3 lv_val4 lv_val5.

" Display the original string
WRITE: / 'Full Sentence 1:', lv_val1,
       / 'Full Sentence 2:', lv_val2.

" Display the split results
WRITE: / 'Split Part 1:', lv_val3,
       / 'Split Part 2:', lv_val4,
       / 'Split Part 3:', lv_val5.
