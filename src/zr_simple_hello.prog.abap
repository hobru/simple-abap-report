REPORT zr_simple_hello.

PARAMETERS: p_name TYPE c LENGTH 30.

START-OF-SELECTION.
  DATA(lv_name) = CONV string( p_name ).
  WRITE / |Hello { lv_name }|.

  WRITE / space.
  WRITE / '--- Flight List (SFLIGHT) ---'.
  WRITE / space.

  SELECT carrid, connid, fldate, price, currency, seatsocc, seatsmax
    FROM sflight
    INTO TABLE @DATA(lt_flights)
    UP TO 20 ROWS
    ORDER BY carrid, connid, fldate.

  IF lt_flights IS INITIAL.
    WRITE / 'No flights found.'.
  ELSE.
    WRITE: / 'Airline', 10 'Flight', 18 'Date', 30 'Price', 48 'Curr', 54 'Occ/Max'.
    ULINE.
    LOOP AT lt_flights INTO DATA(ls_flight).
      WRITE: / ls_flight-carrid,
               10 ls_flight-connid,
               18 ls_flight-fldate,
               30 ls_flight-price CURRENCY ls_flight-currency,
               48 ls_flight-currency,
               54 ls_flight-seatsocc, '/', ls_flight-seatsmax.
    ENDLOOP.
  ENDIF.
