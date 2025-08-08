*&---------------------------------------------------------------------*
*& Report  ZSALES_REPORT
*&---------------------------------------------------------------------*
*& Purpose : Display sales order data based on filters
*&---------------------------------------------------------------------*

*---------------------------------------------------------------------*
* Program Name: ZSTRING_0PE
* Description:  Demonstrates string splitting in ABAP
* Author:       Prawin Kumar Mandal
* Date:         Aug 2025
*---------------------------------------------------------------------*
REPORT zsales_report.

*--- Selection screen
PARAMETERS: p_vkorg TYPE vbak-vkorg OBLIGATORY, "Sales Organization
            p_date_low TYPE vbak-erdat,                  "From Date
            p_date_high TYPE vbak-erdat.                 "To Date

*--- Internal table to hold fetched data
TYPES: BEGIN OF ty_sales,
         vbeln TYPE vbak-vbeln,   "Sales Document
         erdat TYPE vbak-erdat,   "Created On
         vkorg TYPE vbak-vkorg,   "Sales Org
         netwr TYPE vbak-netwr,   "Net Value
       END OF ty_sales.

DATA: it_sales TYPE TABLE OF ty_sales,
      wa_sales TYPE ty_sales.

*--- Fetch data from VBAK (Sales Document Header)
SELECT vbeln erdat vkorg netwr
  INTO TABLE it_sales
  FROM vbak
  WHERE vkorg = p_vkorg
    AND erdat BETWEEN p_date_low AND p_date_high.

*--- Check if data found
IF sy-subrc <> 0.
  WRITE: / 'No Sales Data Found for given criteria.'.
  EXIT.
ENDIF.

*--- Output header
WRITE: / 'Sales Document', 15 'Created On', 30 'Sales Org', 45 'Net Value'.
WRITE: / sy-uline.

*--- Loop through internal table and display data
LOOP AT it_sales INTO wa_sales.
  WRITE: / wa_sales-vbeln,
           15 wa_sales-erdat,
           30 wa_sales-vkorg,
           45 wa_sales-netwr.
ENDLOOP.
