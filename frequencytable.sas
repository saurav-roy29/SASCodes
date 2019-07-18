/* 
SAS code to calculate the Mean, Mode, Median and Standard Deviation
-------------------------------------------------------
Variable to be changed/ considered before running code :-
1) FilePath and Filename (xyz.xlsx).
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

PROC MEANS DATA=WORK.IMPORT MEAN MEDIAN MODE STD;
RUN;
