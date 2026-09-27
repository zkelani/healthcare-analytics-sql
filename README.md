# Healthcare Analytics SQL Project

## Project Overview

This project demonstrates the use of PostgreSQL to analyze healthcare operational data involving patients, appointments, providers, departments, insurance coverage, and authorizations.

The goal of the project was to simulate common healthcare data analysis tasks and identify operational issues that could affect patient access, scheduling, insurance eligibility, and authorization workflows.

The project was built and analyzed using PostgreSQL and pgAdmin 4.

---

## Business Questions

The analysis was designed to answer questions such as:

- Which patients have missing or inactive insurance coverage?
- Which patients have pending or expired authorizations?
- How many appointments are scheduled, cancelled, or no-shows?
- Which providers have the highest appointment workload?
- Which scheduled appointments may have insurance-related issues?
- How can patient, provider, appointment, insurance, and department data be combined to support healthcare operations?

---

## Database Structure

The database contains interconnected healthcare tables including:

- Patients
- Providers
- Departments
- Appointments
- Insurance Plans
- Patient Insurance
- Authorizations

Primary and foreign keys were used to establish relationships between the tables and simulate a relational healthcare database.

---

## SQL Skills Demonstrated

This project demonstrates practical SQL skills including:

- SELECT statements
- WHERE filtering
- INNER JOIN
- LEFT JOIN
- Multiple-table JOINs
- GROUP BY
- ORDER BY
- COUNT()
- CASE expressions
- NULL detection
- Aliases
- Aggregate analysis
- Relational database design
- Primary and foreign key relationships

---

## Analyst Investigation 1: Insurance & Authorization Issues

Insurance and authorization data were analyzed to identify patients who could potentially experience delays in care.

The analysis identified:

- Patients with inactive insurance coverage
- Patients with missing insurance records
- Pending authorizations
- Expired authorizations

For example, the authorization investigation identified both an expired authorization and a pending authorization requiring review.

These types of queries can help healthcare organizations identify eligibility or authorization problems before they affect patient appointments.

---

## Analyst Investigation 2: Appointment Status Analysis

Appointment data was grouped by status to evaluate scheduling activity.

### Results

| Appointment Status | Total |
|---|---:|
| Scheduled | 12 |
| Cancelled | 2 |
| No-Show | 1 |

A total of **15 appointments** were analyzed.

Approximately **80% of appointments were scheduled**, while cancelled and no-show appointments represented opportunities for additional operational review.

---

## Analyst Investigation 3: Provider Workload Analysis

Provider appointment volumes were analyzed by joining provider, department, and appointment data.

The analysis showed differences in workload across providers.

The highest appointment volume in the sample dataset was:

**Emily Davis — Orthopedics — 4 appointments**

Other providers had between 1 and 2 appointments, while one provider had no appointments in the analyzed dataset.

Using a LEFT JOIN allowed providers with zero appointments to remain visible in the analysis.

This type of analysis can help identify differences in provider workload and scheduling utilization.

---

## Analyst Investigation 4: Scheduled Appointment Insurance Review

A multi-table query was created to combine:

- Patient information
- Appointment information
- Provider information
- Department information
- Insurance payer information
- Insurance coverage status

A CASE expression was used to classify insurance records as:

- `Coverage OK`
- `Inactive Insurance`
- `Missing Insurance`

This creates an operational worklist that could help staff identify insurance issues associated with scheduled patient appointments.

---

## Key Findings

The analysis identified several operational insights:

1. Most appointments in the dataset were scheduled successfully.
2. Cancelled and no-show appointments can be isolated for further investigation.
3. Provider workload varies across departments and providers.
4. Some patient records contain inactive or missing insurance coverage.
5. Authorization records can be queried to identify pending or expired authorizations.
6. Combining scheduling and insurance information can help identify appointments that may require staff intervention before the date of service.

---

## Healthcare Application

In a real healthcare environment, similar SQL analysis could support:

- Patient access teams
- Revenue cycle operations
- Insurance verification
- Authorization management
- Appointment scheduling
- Provider utilization analysis
- Healthcare application support
- EHR reporting and analytics

These queries demonstrate how relational healthcare data can be transformed into actionable information for operational teams.

---

## Tools Used

- PostgreSQL
- pgAdmin 4
- SQL
- GitHub

---

## Repository Files

### `healthcare_analytics.sql`

Contains the database structure, sample healthcare data, table relationships, and analyst investigation queries used throughout the project.

---

## Future Improvements

Future versions of this project could include:

- Appointment cancellation rate calculations
- No-show rate analysis
- Department-level performance metrics
- Insurance payer analysis
- Authorization expiration alerts
- Additional data validation queries
- Dashboard visualization using Power BI or Tableau

---

## About This Project

This project was created as part of my portfolio to demonstrate SQL, healthcare data analysis, relational database concepts, and problem-solving skills relevant to healthcare technology, application support, EHR support, and healthcare analyst roles.
