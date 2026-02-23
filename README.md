## 📌 Project Overview

This project represents a complete database engineering workflow for a **Company Management System**, implemented as part of an ITI task.

The project covers:

* Conceptual Design (ERD)
* Logical Design (Relational Mapping)
* Physical Implementation (SQL)
* Mixed implementation using:

  * Manual SQL scripting
  * SQL Server Wizard tools
* Query development and testing

---

## 🏗 Database Entities

The system models the following core entities:

* Employee
* Department
* Project
* Dependent
* Dept_Locations
* Work_On (M:N relationship)

---

## 📊 ERD Design

The ERD was designed following standard database modeling principles:

* Strong & Weak entities
* 1:1 relationships
* 1:N relationships
* M:N relationships with associative entity
* Multivalued attributes handled via separate table
* Recursive relationship (Supervision)

---

## 🔄 ER → Relational Mapping

The mapping includes:

* Primary Keys
* Foreign Keys
* Composite Keys (Work_On, Dependent, Dept_Locations)
* Referential Integrity Constraints
* Self-referencing Foreign Key (SUPERVISION)

---

## 💻 Implementation Details

### ✔ Implemented Using SQL Code:

* Table creation
* Constraints
* Primary & Foreign keys
* Relationship enforcement
* Custom queries

### ✔ Implemented Using SQL Server Wizard:

* Some relationships
* Constraint configuration
* Table adjustments

---

## 🧠 Queries Included

The project includes multiple queries demonstrating:

* JOIN operations
* Aggregation
* Filtering
* Relationship-based retrieval
* Subqueries

---

## 🛠 Technologies Used

* Microsoft SQL Server
* T-SQL
* SSMS
* ERD Modeling

---

## 🎯 Learning Outcomes

* Full database design lifecycle
* ER modeling best practices
* Relational schema transformation
* Constraint handling
* SQL query writing
* Real-world company schema modeling
