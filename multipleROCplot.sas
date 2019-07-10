/* 
SAS Code to generate a single Receiver Operating Curve. 
i.e. Dataset can have n number of variables
StatusVariable = Binary Variable (Status Variable)
Var1 = Continuous Variable (Testing Variable)
.
.
.
VarN
* Var1 - VarN has to be continuous variables
-------------------------------------------------------
Variable to be changed/ considered before running code :-
1) FilePath and Filename (xyz.xlsx).
2) Variables (written in this code as StatusVariable and Var1, Var2, Var3... VarN).
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
	MODEL StatusVariable(EVENT='0')= Var1 Var2 Var3;
	ROC 'Var1' PRED=Var1; 
	ROC 'Var2' PRED=Var2;
	ROC 'Var3' PRED=Var3;
	ODS SELECT ROCCURVE;
	ODS SELECT ROCOVERLAY;
RUN;

ODS GRAPHICS OFF;
