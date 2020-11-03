       IDENTIFICATION DIVISION.
       PROGRAM-ID.    EVALUAT.
       AUTHOR.        RICHARD DO NASCIMENTO FAGUNDES.
      *
       ENVIRONMENT DIVISION.
      *
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT RESPONSE ASSIGN TO RESPONSE.
           SELECT ANSWERS ASSIGN TO ANSWERS.

       DATA DIVISION.
       FILE SECTION.

       FD  RESPONSE RECORD CONTAINS 80 CHARACTERS RECORDING MODE F.
       01  RESP-DESCRIPTION   PIC X(15) VALUE SPACES.

       FD  ANSWERS RECORD CONTAINS 80 CHARACTERS RECORDING MODE F.
       01  ANS-DESCRIPTION   PIC X(15).

       WORKING-STORAGE SECTION.

       01  WS-EOF PIC A(1).

       01  COUNTERS.
           05  COUNTER-EQ                 PIC 9(3).
           05  COUNTER-ALL                PIC 9(3).


      ****************************************************************
      *                  PROCEDURE DIVISION                          *
      ****************************************************************
       PROCEDURE DIVISION.
      *
       A000-START.
           OPEN INPUT RESPONSE.
           OPEN INPUT ANSWERS.

           PERFORM UNTIL WS-EOF = 'Y'
              PERFORM A000-READ-RES
              PERFORM A000-READ-ANS

              PERFORM A000-TOTAL

              IF RESP-DESCRIPTION IS EQUAL TO ANS-DESCRIPTION THEN
                 PERFORM A000-EQUAL
              END-IF

           END-PERFORM.

           CLOSE RESPONSE.
           CLOSE ANSWERS.

           DISPLAY COUNTER-EQ ' correct rows of ' COUNTER-ALL.

           STOP RUN.
      *
       A000-EQUAL.
           ADD 1 TO COUNTER-EQ.
      *
       A000-TOTAL.
           ADD 1 TO COUNTER-ALL.
      *
       A000-READ-RES.
           READ RESPONSE
           AT END MOVE 'Y' TO WS-EOF
           END-READ.
      *
       A000-READ-ANS.
           READ ANSWERS
           AT END MOVE 'Y' TO WS-EOF
           END-READ.
