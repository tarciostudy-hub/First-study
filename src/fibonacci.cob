       IDENTIFICATION DIVISION.
       PROGRAM-ID. FIBONACCI.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(3) VALUE 0.
       01 A PIC 9(10) VALUE 0.
       01 B PIC 9(10) VALUE 1.
       01 C PIC 9(10) VALUE 0.
       01 I PIC 9(3) VALUE 0.
       
       PROCEDURE DIVISION.
           DISPLAY "Enter number of Fibonacci terms: ".
           ACCEPT N.
           
           DISPLAY "Fibonacci Sequence:".
           
           PERFORM VARYING I FROM 1 BY 1
               UNTIL I > N
               DISPLAY A
               COMPUTE C = A + B
               MOVE B TO A
               MOVE C TO B
           END-PERFORM.
           
           STOP RUN.