Project Name: Oil and Gas Tax Registrants List


Project Introduction: The project involves the application of RDMS (Relational Database Management System) skills in order to support the faster retreival of key entity information.


Project Objective: 

The main goal of this project is the efficient use of SQL queries and Entity Relationship
Diagrams (ERD) for the purpose of extracting complex information from the database
encompassing the list of Fuel And Gasoline Tax Registrants. This project will enable
consumers, clients and dealers to gain insights about queries to identify the business
entities which have been authorised by the Canadian Ministry of Finance to deal with
petrol, such as petrol, propane, petrol, and diesel fuel.

Data Set Link: https://data.ontario.ca/dataset/fuel-and-gasoline-tax-registrant-list 



Project Content:

a) Database Shematics

The Entity Relationship Diagram, the database consists of four
tables:-


1) Date_modification_details:

Primary Key: Date_modified
Description:
This table stores information about registrants who have renewed their
registration details. It includes the date of modification and registrants'
names. The "Date Modified" column serves as the primary key for this
table.


2) Address_details:

Primary Key: Address
Description:
This table contains information about addresses, including the city name,
province, postal code, and country of origin. The "Address" column acts as
the primary key for this table.


3) Registrants:

Primary Key: Registrant_name
Foreign Key: Date_modied
Description:
This table provides detailed information about business entities, including
their names, city names, and renewal dates. The "Registrant Name"
column serves as the primary key, and it has a foreign key relationship
with the "Date Modified" column from the "Date Modification Details" table.


4) Professional_details:

Primary Key: Professional_objective
Foreign Key: Reigstrant_name, Address
Description:
This table contains information about business entities' professional
objectives related to fuel and gasoline products, as well as their names
and addresses. The "Professional Objective" column is the primary key,
and it has foreign key relationships with the "Registrant Name" column
from the "Registrants" table and the "Address" column from the "Address
Details" table.


b) SQL Queries:-

Query-1: This query uses simple Select and from syntax to retrieve all the details
about the registrants from date modification details table.


Query-2: The query uses NOT null syntax to extract the details related to
registrants’name, city name and the renewal dates from the registrants table of those
entities who have renewed their registration documents.


Query-3:This query also focuses on extracting the details of registrants who modified
their registry documents, but in this case we will be using self inner-join to remove all
the null values from our renewal dates from registrants table.


Query -4 : This query mainly focuses on getting the details of registrants who fall under
the category of early registrants and late registrants using case statements and taking
the date 2015-04-01 as the basis for the whole query.


QUERY-5: The query focuses on getting the information about the professional
objectives of registrants regarding uage of petroleum products who belong to the city of
NEPEAN using INNER JOIN syntax.


Query-6: The query focuses on retrieving information about the registrant name whose
professional objective is Propane Collection and Propane transport.


Query-7: Getting the count of registrants belonging to the city of toronto and Calgary
using COUNT, IN,Group BY, and Order By statements.


Query-8: This query focuses on getting the count of registrants which deal in Propane
products using COUNT and list syntaxes like ('Propane Transport','Propane
Collector','Propane Transporter','Propane Aquisition') in our where statement for setting
multiple filters and replacing the usage of ‘=’ and ’<>’ syntaxes.


Query-9: This query mainly focuses on getting the name and address details of
registrants who have renewed their documents using INNER JOIN syntax between
date_modification_details table and professional_details table.


c) Views:

1) View Query -1:
Quebec and Alberta details:-
VIEW statement to store the details of registrants belonging to the province of
Quebec and Alberta.


2) View Query -2:
Date modification status:-
View statement to store the details of registrants who have not modified their
documents.

