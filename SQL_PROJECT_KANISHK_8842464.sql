-------------TABLE-1:Creating table named 'address_details'
Create Table address_details
('address' character varying(200) PRIMARY KEY,
'city_name' character varying(60),
'province' character varying(60),
'postal_code' character varying(200),
'country' character varying(60)
);

-------------TABLE-2: Creating table named 'date_modification_details'
Create Table date_modification_details
('date_modified' date Primary Key,
'registrant_name' character varying(90),
);

------------TABLE-3:Creating table named 'professional_details'
Create table professional_details
('professional_objective'character varying(60) Primary key,
'registrant_name' character varying(90) foreign key,
'address' character varying(200) foreign key
);
 
------------TABLE-4:Creating table named 'registrants'
Create table registrants
('registrant_name' character varying(90) Primary key,
'city_name' character varying(60),
'date_modified' date foreign key
);

-------------Queries

--QUERY-1 : This query uses simple Select and from syntax to retrieve all the details about  the registrants from date modification details table.

Select registrant_name,city_name,date_modified
From registrants;

--QUERY-2 : The query  uses  NOT null syntax to extract the details related to registrants’name, city name and the renewal dates from the registrants table of those entities who have renewed their registration documents.

select registrant_name,city_name,date_modified
from registrants where date_modified is NOT null;

--QUERY-3 : This query also focuses on extracting the details of registrants who modified their registry documents, but in this case we will be using self inner-join to remove all the null values from our renewal dates from registrants table.

select R.registrant_name,R.city_name,D.date_modified
from registrants R INNER JOIN registrants D
on R.date_modified = D.date_modified
order by R.registrant_name;

--Query-4 : This query mainly focuses on getting the details of registrants who fall under the category of early registrants and late registrants using case statements and taking the date 2015-04-01 as the basis for the whole query
   

select registrant_name,
case 
when date_modified >= '2015-04-01' then 'LATE_registrants'
when date_modified < '2015-04-01' then 'Early_registrants'
END AS REGISTRATION_STATUS
from date_modification_details
order by registrant_name;

----Query-5 : The query focuses on getting the information about the professional objectives of registrants regarding uage of petroleum products who belong to the city of NEPEAN using INNER JOIN syntax.

select R.registrant_name,PR.professional_objective,AD.city_name
from registrants R INNER JOIN professional_details PR on R.registrant_name = PR.registrant_name 
INNER JOIN address_details AD ON PR.address = AD.address
where AD.city_name = 'Nepean'
order by R.registrant_name;

--Query-6 : The query focuses on retrieving information about the registrant name whose professional objective is Propane Collection and Propane transport.

select registrant_name from professional_details
where professional_objective IN (select professional_objective from professional_details
where professional_objective IN ('Propane Collector','Propane Transporter'));

--Query-7 : Getting the count of registrants belonging to the city of toronto and Calgary using COUNT, IN,Group BY, and Order By statements.

select city_name,count(registrant_name) AS count_OF_registrants
from registrants 
where city_name IN ('Toronto','Calgary')
group by city_name
order by city_name;

--Query-8 : This query focuses on getting the count of registrants which deal in Propane products using COUNT and list syntaxes like ('Propane Transport','Propane Collector','Propane Transporter','Propane Aquisition') in our where statement for setting multiple filters and replacing the usage of ‘=’ and ’<>’ syntaxes.   

select professional_objective,count(registrant_name) AS COUNT_OF_REGISTRANTS
from professional_details 
where professional_objective IN ('Propane Transport','Propane Collector','Propane Transporter','Propane Aquisition')  
group by professional_objective;

--Query-9 : This query mainly  focuses on getting the name and address details of registrants who have renewed their documents using INNER JOIN syntax between date_modification_details table and professional_details table.

select D.registrant_name,PR.address 
from date_modification_details D INNER JOIN professional_details PR
ON D.registrant_name = PR.registrant_name; 

--Query-10 : This query focuses on retrieving the details of registrants who belong to the province of Ontario using INNER JOIN syntax between registrants and address_details table. 
Select R.registrant_name,AD.address,AD.city_name,AD.province,AD.postal_code,AD.country
from registrants R INNER JOIN address_details AD ON R.city_name = AD.city_name
where AD.province = 'ON'
order by R.registrant_name;

-----------------Query for Views:
--View-1: VIEW statement to store the details of registrants belonging to the province of Quebec and Alberta.

Create view Quebec_and_Alberta_details AS select R.registrant_name,AD.address,AD.city_name,AD.province
from registrants R INNER JOIN address_details AD ON R.city_name = AD.city_name
where AD.province IN ('QC','AB');

--View-2: View statement to store the details of registrants who have not modified their documents.
 
create view Date_modification_status AS 
select registrant_name,city_name
from registrants WHERE date_modified is Null;



