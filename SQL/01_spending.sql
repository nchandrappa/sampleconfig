DROP TABLE IF EXISTS SPENDING;
CREATE TABLE SPENDING AS (
  SELECT
    SSN,
    COUNT(*)                        AS NUM_TRANS,
    DATE_FORMAT(TRANSDATE, '%Y-%M') AS YEAR_MON,
    SUM(FOOD_DINING)                AS FOOD_DINING,
    SUM(UTILITIES)                  AS UTILITIES,
    SUM(GROCERY_NET)                AS GROCERY_NET,
    SUM(HOME)                       AS HOME,
    SUM(PHARMACY)                   AS PHARMACY,
    SUM(SHOPPING_POS)               AS SHOPPING_POS,
    SUM(KIDS_PETS)                  AS KIDS_PETS,
    SUM(PERSONAL_CARE)              AS PERSONAL_CARE,
    SUM(MISC_POS)                   AS MISC_POS,
    SUM(GAS_TRANSPORT)              AS GAS_TRANSPORT,
    SUM(MISC_NET)                   AS MISC_NET,
    SUM(HEALTH_FITNESS)             AS HEALTH_FITNESS,
    SUM(SHOPPING_NET)               AS SHOPPING_NET,
    SUM(TRAVEL)                     AS TRAVEL
  FROM (
         SELECT
           SSN        AS SSN,
           CASE WHEN CATEGORY = 'FOOD_DINING'
             THEN (AMT)
           ELSE 0 END AS FOOD_DINING,
           CASE WHEN CATEGORY = 'UTILITIES'
             THEN (AMT)
           ELSE 0 END AS UTILITIES,
           CASE WHEN CATEGORY = 'GROCERY_NET'
             THEN (AMT)
           ELSE 0 END AS GROCERY_NET,
           CASE WHEN CATEGORY = 'HOME'
             THEN (AMT)
           ELSE 0 END AS HOME,
           CASE WHEN CATEGORY = 'PHARMACY'
             THEN (AMT)
           ELSE 0 END AS PHARMACY,
           CASE WHEN CATEGORY = 'SHOPPING_POS'
             THEN (AMT)
           ELSE 0 END AS SHOPPING_POS,
           CASE WHEN CATEGORY = 'KIDS_PETS'
             THEN (AMT)
           ELSE 0 END AS KIDS_PETS,
           CASE WHEN CATEGORY = 'PERSONAL_CARE'
             THEN (AMT)
           ELSE 0 END AS PERSONAL_CARE,
           CASE WHEN CATEGORY = 'MISC_POS'
             THEN (AMT)
           ELSE 0 END AS MISC_POS,
           CASE WHEN CATEGORY = 'GAS_TRANSPORT'
             THEN (AMT)
           ELSE 0 END AS GAS_TRANSPORT,
           CASE WHEN CATEGORY = 'MISC_NET'
             THEN (AMT)
           ELSE 0 END AS MISC_NET,
           CASE WHEN CATEGORY = 'HEALTH_FITNESS'
             THEN (AMT)
           ELSE 0 END AS HEALTH_FITNESS,
           CASE WHEN CATEGORY = 'SHOPPING_NET'
             THEN (AMT)
           ELSE 0 END AS SHOPPING_NET,
           CASE WHEN CATEGORY = 'TRAVEL'
             THEN (AMT)
           ELSE 0 END AS TRAVEL,
           TRANSDATE
         FROM TRANSACTION_HISTORY) GROUPED
  GROUP BY SSN, DATE_FORMAT(TRANSDATE, '%Y-%M')
);
