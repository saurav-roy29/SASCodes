/* 

SAS Code to generate a single Receiver Operating Curve. 
i.e. Dataset should have two variable
Var1 = Continuous Variable (Testing Variable)
Var2 = Binary Variable (Status Variable)
-------------------------------------------------------
Variable to be changed/ considered before running code :-

1) FilePath and Filename (xyz.xlsx).
2) Variables (written in this code as StatusVariable and ContinuousVarable).
3) EVENT='1' or EVENT='0' whichever the user considers to be the positive class.
-------------------------------------------------------
Written by:
Saurav Roy,
Research and Development Engineer,
Neuroimaging and Neurospectroscopy Lab,
National Brain Research Centre,
India.

*/

FILENAME REFFILE 
	'/folders/myfolders/sasuser.v94/ExcelData/ACPC/xyz.xlsx';

PROC IMPORT DATAFILE=REFFILE DBMS=XLSX OUT=WORK.IMPORT;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.IMPORT;
RUN;

ODS GRAPHICS ON;

PROC LOGISTIC DATA=WORK.IMPORT PLOTS(ONLY)=ROC(ID=OBS);
	MODEL StatusVariable(EVENT='1')= ContinuousVariable;
	ODS SELECT ROCCURVE;
RUN;

ODS GRAPHICS OFF;

