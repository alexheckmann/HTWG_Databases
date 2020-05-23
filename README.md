<h1>Databases & Information Systems</h1>

This repository contains the conceptual and logical design of a relational database as well as the implementation in SQL and PL/SQL. 
The underlying database management system is using <i>Oracle 12c</i>. Additionally, it contains the implementation of a data warehouse following a star schema, used as an OLAP system.<br><br>

The OLTP database is used for a fictional holiday home agency resembling AirBnB, containing data about users, 
holiday homes, business aspects, but also information about the next airport of both the user's location and the 
holiday home's location, flights and tourist attractions. Data integrity is ensured by multiple mechanismns, 
static integrity constraints are given by referential integrity and other check constraints, dynamic integrity constraints are given as triggers, 
so no significant data (i.e. bookings) can be deleted; if one executes statements trying to delete booking records, 
the trigger moves the affected data to an archive instead. <br><br>

The OLAP database is based on a star schema. After the ETL process, data regarding users, holiday homes, and the periods of time in which people booked a holiday home may be analyzed. <br><br>
This repository also contains a simple example program written in Java using JDBC. It allows an authorized user to create new users, search a user by name, or book or delete a holiday home.