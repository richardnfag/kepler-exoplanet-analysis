//CHECKJCL  JOB 1,NOTIFY=&SYSUID
//***************************************************/
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..SOURCE(CHECKCBL),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(CHECKCBL),DISP=SHR
//***************************************************/
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=CHECKCBL
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//RESPONSE   DD DSN=&SYSUID..SOURCE(RESPONSE),DISP=SHR
//ANSWERS   DD DSN=&SYSUID..SOURCE(ANSWERS),DISP=SHR
//SYSOUT    DD SYSOUT=*,OUTLIM=15000
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
//***************************************************/
// ELSE
// ENDIF
