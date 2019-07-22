/* 
SAS Code to generate results for Univariate Analysis.
VAR = The variable label
-------------------------------------------------------
Variable to be changed/ considered before running code :-
1) FilePath and Filename (xyz.xlsx).
2) VAR (Univariate Variable)
-------------------------------------------------------
Written by:
Saurav Roy,
Research and Development Engineer,
Neuroimaging and Neurospectroscopy Lab,
National Brain Research Centre,
India.
*/


FILENAME REFFILE 
	'/folders/myfolders/sasuser.v94/ExcelData/Random/probasketballPlayers.xlsx';

PROC IMPORT DATAFILE=REFFILE DBMS=XLSX OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT;
RUN;

PROC UNIVARIATE DATA=wORK.IMPORT;
  VAR HEIGHTS;
RUN;
