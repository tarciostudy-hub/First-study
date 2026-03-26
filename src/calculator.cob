       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM1 PIC S9(5)V9(2) VALUE 0.
       01 NUM2 PIC S9(5)V9(2) VALUE 0.
       01 RESULT PIC S9(5)V9(2) VALUE 0.
       01 OPERATION PIC X(1).
       
       PROCEDURE DIVISION.
           DISPLAY "Enter first number: ".
           ACCEPT NUM1.
           
           DISPLAY "Enter operation (+, -, *, /): ".
           ACCEPT OPERATION.
           
           DISPLAY "Enter second number: ".
           ACCEPT NUM2.
           
           EVALUATE OPERATION
               WHEN "+"
                   COMPUTE RESULT = NUM1 + NUM2
               WHEN "-"
                   COMPUTE RESULT = NUM1 - NUM2
               WHEN "*"
                   COMPUTE RESULT = NUM1 * NUM2
               WHEN "/"
                   IF NUM2 NOT = 0
                       COMPUTE RESULT = NUM1 / NUM2
                   ELSE
                       DISPLAY "Error: Division by zero"
                       STOP RUN
                   END-IF
               WHEN OTHER
                   DISPLAY "Invalid operation"
                   STOP RUN
           END-EVALUATE.
           
           DISPLAY "Result: " RESULT.
           STOP RUN.