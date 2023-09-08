September 8, 2023 / Jenny Spicer

Phase 3 builds on our previous Phase, which was to "Write a Java program that does a simple evaluation for the data types of values in a file". Phase 3 takes our data and generates SQL insert statements.

To run:
Use the command "java Phase3 animal" in the terminal to take the information from animal.txt and generate SQL insert statements, printed out into the file "InsertStatements.csv".




This Java file can be used to generate SQL insert statements for other text files, not limited to animal.txt.


To double check:
Using Oracle SQL Developer, copy/paste the InsertStatements.csv and animal_schema.sql contents into a new file and run. Run "SELECT * FROM Animal" and all data should appear.