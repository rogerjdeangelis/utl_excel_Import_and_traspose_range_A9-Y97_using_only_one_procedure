Import and transpose the excel range A9:Y97 using only one procedure

   WORKING CODE (All of it)
   (I made one small change, two Industries were duplicated, I made them unique)

     1. heade=no because oc colname array 1948-1969=f4-f25, skipped over addenda, titles and footnotes
     2. drop line and column 3 (F3)
     3. importing box A9:Y97

    options validvarname=any;
    libname xel "d:/xls/sample.xlsx" header=no;
    proc transpose data=xel.'sheet1$A9:Y97'n(rename=(f4-f25=yr_1948-yr_1969)) out=want;
    id  f2;

see
https://goo.gl/mz9kwk
https://communities.sas.com/t5/Base-SAS-Programming/Import-a-xlsx-file-with-years-in-the-8th-row/m-p/408216


HAVE
-----

  Excel  d:/xls/sample.xlsx sheet1

    --------------------------------------------------------------------
    |             A                   |  B    |  C    |   D   |  E     |
    |------------------------------------------------------------------|
    |                                 | 1948  | 1949  | ....  | 1969   |
    |---------------------------------+-------+-------+-------+--------|
 9  |Coal mining                      |1952   |1519   |....   |1445    |
    |---------------------------------+-------+-------+-------+--------|
10  |Compensation of employees        |144470 |144512 |....   |586016  |
    |---------------------------------+-------+-------+-------+--------|
11  |Farms                            |3000   |2817   |....   |4023    |
    |---------------------------------+-------+-------+-------+--------|
12  |Metal mining                     |354    |343    |...    |894     |
    |---------------------------------+-------+-------+-------+--------|
13  |Oil and gas extraction           |998    |1018   |....   |2767    |
    |---------------------------------+-------+-------+-------+--------|
14  |Mining                           |3596   |3181   |....   |6147    |
    |---------------------------------+-------+-------+-------+--------|
16  |Private industries               |121529 |119169 |....   |458004  |
    |---------------------------------+-------+-------+-------+--------|
17  |Domestic industries              |144384 |144454 |....   |585994  |
    --------------------------------------------------------------------


WANT
====

WORK.WANT

              Compensation   Domestic      Private  ...
 _NAME_    of employees     industries  industries  ...    Farms

 yr_1948      144470          144384      121529    ...     3000
 yr_1949      144512          144454      119169    ...     2817
 yr_1950      158465          158387      131318    ...     2821
 yr_1951      185927          185913      150726    ...     2932
 yr_1952      201341          201339      161201    ...     2868
 yr_1953      215522          215529      174365    ...     2746
 yr_1954      214443          214500      172671    ...     2606
 yr_1955      230899          230969      187217    ...     2598
 yr_1956      249640          249722      203415    ...     2611
 yr_1957      262980          263058      213662    ...     2713
 yr_1958      265119          265191      212087    ...     2869
 yr_1959      286309          286390      231201    ...     2952
 yr_1960      301851          302006      243031    ...     3093
 yr_1961      311088          311232      248143    ...     3225
 yr_1962      332912          333007      265675    ...     3319
 yr_1963      351179          351242      279360    ...     3413
...


*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

 use link to download the excel workbook

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

libname xel "d:/xls/sample.xlsx" header=no;
proc transpose data=xel.'sheet1$A9:Y97'n( drop=f1
    rename=(f4-f25=yr_1948-yr_1969)) out=havxpo;
id  f2;
run;quit;
libname xel clear;





