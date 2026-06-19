REPORT zr_simple_hello.

PARAMETERS: p_name TYPE c LENGTH 30.

START-OF-SELECTION.
  DATA(lv_name) = CONV string( p_name ).
  WRITE / |Hello { lv_name }|.
