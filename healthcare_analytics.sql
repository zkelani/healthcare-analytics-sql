CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    specialty VARCHAR(100)
);
INSERT INTO departments
    (department_name, location, specialty)
VALUES
    ('Primary Care', 'Sugar Land', 'Family Medicine'),
    ('Cardiology', 'Houston', 'Cardiology'),
    ('Orthopedics', 'Sugar Land', 'Orthopedics'),
    ('Physical Therapy', 'Missouri City', 'Rehabilitation'),
    ('OB/GYN', 'Houston', 'Women''s Health'),
    ('Neurology', 'Houston', 'Neurology');
	SELECT *
FROM departments;

CREATE TABLE providers (
    provider_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100),
    department_id INTEGER NOT NULL,
    active_status BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_provider_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO providers
    (first_name, last_name, specialty, department_id)
VALUES
    ('Sarah', 'Johnson', 'Family Medicine', 1),
    ('Michael', 'Williams', 'Cardiology', 2),
    ('Emily', 'Davis', 'Orthopedics', 3),
    ('David', 'Martinez', 'Physical Therapy', 4),
    ('Jessica', 'Brown', 'OB/GYN', 5),
    ('Daniel', 'Wilson', 'Neurology', 6),
    ('Amanda', 'Taylor', 'Family Medicine', 1),
    ('James', 'Anderson', 'Physical Therapy', 4);

	SELECT *
FROM providers;

SELECT
    p.first_name,
    p.last_name,
    p.specialty,
    d.department_name,
    d.location
FROM providers p
JOIN departments d
    ON p.department_id = d.department_id;

	CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    medical_record_number VARCHAR(20) UNIQUE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(2),
    registration_date DATE DEFAULT CURRENT_DATE,
    active_status BOOLEAN DEFAULT TRUE
);

INSERT INTO patients
    (medical_record_number, first_name, last_name, date_of_birth,
     gender, phone, email, city, state, registration_date)
VALUES
    ('MRN10001', 'Olivia', 'Carter', '1988-04-12',
     'Female', '281-555-0101', 'olivia.carter@example.com',
     'Sugar Land', 'TX', '2026-01-15'),

    ('MRN10002', 'Ethan', 'Brooks', '1975-09-23',
     'Male', '713-555-0102', 'ethan.brooks@example.com',
     'Houston', 'TX', '2026-02-03'),

    ('MRN10003', 'Sophia', 'Reed', '1994-06-18',
     'Female', '832-555-0103', 'sophia.reed@example.com',
     'Missouri City', 'TX', '2026-02-20'),

    ('MRN10004', 'Noah', 'Bennett', '1962-11-05',
     'Male', '281-555-0104', 'noah.bennett@example.com',
     'Richmond', 'TX', '2026-03-01'),

    ('MRN10005', 'Ava', 'Mitchell', '2001-01-29',
     'Female', '713-555-0105', 'ava.mitchell@example.com',
     'Houston', 'TX', '2026-03-14'),

    ('MRN10006', 'Liam', 'Parker', '1983-07-07',
     'Male', '832-555-0106', 'liam.parker@example.com',
     'Katy', 'TX', '2026-04-02'),

    ('MRN10007', 'Mia', 'Collins', '1999-12-16',
     'Female', '281-555-0107', 'mia.collins@example.com',
     'Sugar Land', 'TX', '2026-04-19'),

    ('MRN10008', 'Lucas', 'Turner', '1958-03-25',
     'Male', '713-555-0108', 'lucas.turner@example.com',
     'Houston', 'TX', '2026-05-05'),

    ('MRN10009', 'Isabella', 'Scott', '1991-08-11',
     'Female', '832-555-0109', 'isabella.scott@example.com',
     'Richmond', 'TX', '2026-05-21'),

    ('MRN10010', 'Henry', 'Adams', '1970-10-30',
     'Male', '281-555-0110', 'henry.adams@example.com',
     'Missouri City', 'TX', '2026-06-08');

	 SELECT *
FROM patients;

SELECT *
FROM patients
WHERE city = 'Houston';

SELECT *
FROM patients
WHERE city = 'Sugar Land'
AND gender = 'Female';

SELECT *
FROM patients
WHERE city = 'Missouri City'
AND gender = 'Male';

CREATE TABLE insurance_plans (
    insurance_plan_id SERIAL PRIMARY KEY,
    payer_name VARCHAR(100) NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    plan_type VARCHAR(50),
    requires_authorization BOOLEAN DEFAULT FALSE
);

INSERT INTO insurance_plans
    (payer_name, plan_name, plan_type, requires_authorization)
VALUES
    ('BlueCross BlueShield', 'Blue Choice PPO', 'PPO', FALSE),
    ('UnitedHealthcare', 'Choice Plus', 'PPO', FALSE),
    ('Aetna', 'Aetna HMO', 'HMO', TRUE),
    ('Cigna', 'Open Access Plus', 'PPO', FALSE),
    ('Medicare', 'Medicare Part B', 'Government', FALSE),
    ('Medicaid', 'Texas Medicaid', 'Government', TRUE);

	SELECT *
FROM insurance_plans;

CREATE TABLE patient_insurance (
    patient_insurance_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    insurance_plan_id INTEGER NOT NULL,
    member_id VARCHAR(50) NOT NULL,
    coverage_status VARCHAR(20) NOT NULL,
    effective_date DATE NOT NULL,
    termination_date DATE,

    CONSTRAINT fk_patient_insurance_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_patient_insurance_plan
        FOREIGN KEY (insurance_plan_id)
        REFERENCES insurance_plans(insurance_plan_id)
);

INSERT INTO patient_insurance
    (patient_id, insurance_plan_id, member_id,
     coverage_status, effective_date, termination_date)
VALUES
    (1, 1, 'BC100001', 'Active', '2026-01-01', NULL),
    (2, 5, 'MC100002', 'Active', '2025-01-01', NULL),
    (3, 3, 'AE100003', 'Active', '2026-01-01', NULL),
    (4, 2, 'UH100004', 'Active', '2026-01-01', NULL),
    (5, 6, 'MD100005', 'Active', '2026-01-01', NULL),
    (6, 4, 'CG100006', 'Active', '2026-01-01', NULL),
    (7, 1, 'BC100007', 'Active', '2026-01-01', NULL),
    (8, 5, 'MC100008', 'Active', '2025-01-01', NULL),
    (9, 3, 'AE100009', 'Inactive', '2025-01-01', '2026-06-30');

	SELECT *
FROM patient_insurance;

SELECT *
FROM patient_insurance;

SELECT
    p.patient_id,
    p.medical_record_number,
    p.first_name,
    p.last_name,
    pi.member_id,
    pi.coverage_status
FROM patients p
LEFT JOIN patient_insurance pi
    ON p.patient_id = pi.patient_id;

	FROM patients p
LEFT JOIN patient_insurance pi

SELECT
    p.patient_id,
    p.medical_record_number,
    p.first_name,
    p.last_name,
    pi.member_id,
    pi.coverage_status
FROM patients p
LEFT JOIN patient_insurance pi
    ON p.patient_id = pi.patient_id
WHERE pi.patient_id IS NULL;

SELECT
    p.patient_id,
    p.medical_record_number,
    p.first_name,
    p.last_name,
    pi.member_id,
    pi.coverage_status
FROM patients p
LEFT JOIN patient_insurance pi
    ON p.patient_id = pi.patient_id
WHERE pi.coverage_status = 'Inactive';


SELECT
    p.patient_id,
    p.medical_record_number,
    p.first_name,
    p.last_name,
    pi.member_id,
    pi.coverage_status
FROM patients p
LEFT JOIN patient_insurance pi
    ON p.patient_id = pi.patient_id
WHERE pi.patient_id IS NULL;


SELECT
    p.patient_id,
    p.medical_record_number,
    p.first_name,
    p.last_name,
    pi.member_id,
    pi.coverage_status
FROM patients p
LEFT JOIN patient_insurance pi
    ON p.patient_id = pi.patient_id
WHERE pi.coverage_status = 'Inactive';


CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    provider_id INTEGER NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    appointment_type VARCHAR(50) NOT NULL,
    appointment_status VARCHAR(30) NOT NULL,
    scheduled_date DATE NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);


INSERT INTO appointments
    (patient_id, provider_id, appointment_date, appointment_time,
     appointment_type, appointment_status, scheduled_date)
VALUES
    (1, 1, '2026-09-28', '09:00', 'New Patient', 'Scheduled', '2026-09-10'),
    (2, 2, '2026-09-28', '10:30', 'Follow-Up', 'Scheduled', '2026-09-12'),
    (3, 3, '2026-09-29', '11:00', 'New Patient', 'Scheduled', '2026-09-15'),
    (4, 4, '2026-09-29', '13:30', 'Evaluation', 'Scheduled', '2026-09-16'),
    (5, 5, '2026-09-30', '09:30', 'Follow-Up', 'Scheduled', '2026-09-18'),
    (6, 6, '2026-09-30', '14:00', 'New Patient', 'Cancelled', '2026-09-19'),
    (7, 7, '2026-10-01', '08:30', 'Follow-Up', 'Scheduled', '2026-09-20'),
    (8, 2, '2026-10-01', '11:30', 'Follow-Up', 'No-Show', '2026-09-21'),
    (9, 3, '2026-10-02', '13:00', 'Evaluation', 'Scheduled', '2026-09-22'),
    (10, 4, '2026-10-02', '15:30', 'Evaluation', 'Scheduled', '2026-09-23'),

    (1, 1, '2026-10-05', '10:00', 'Follow-Up', 'Scheduled', '2026-09-24'),
    (3, 3, '2026-10-05', '14:30', 'Follow-Up', 'Scheduled', '2026-09-24'),
    (5, 5, '2026-10-06', '09:00', 'Follow-Up', 'Scheduled', '2026-09-25'),
    (7, 7, '2026-10-06', '11:00', 'Follow-Up', 'Cancelled', '2026-09-25'),
    (9, 3, '2026-10-07', '15:00', 'Follow-Up', 'Scheduled', '2026-09-26');


SELECT *
FROM appointments;


SELECT *
FROM appointments
WHERE appointment_status = 'Cancelled';


SELECT
    p.first_name,
    p.last_name,
    a.appointment_date,
    a.appointment_type,
    a.appointment_status
FROM appointments AS a
JOIN patients AS p
    ON a.patient_id = p.patient_id
WHERE a.appointment_status = 'Cancelled';


SELECT
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    a.appointment_date,
    a.appointment_type,
    pr.first_name AS provider_first_name,
    pr.last_name AS provider_last_name,
    pr.specialty,
    a.appointment_status
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN providers pr
    ON a.provider_id = pr.provider_id
WHERE a.appointment_status = 'Cancelled';


SELECT
    p.medical_record_number,
    p.first_name,
    p.last_name,
    a.appointment_date,
    a.appointment_type,
    ip.payer_name,
    pi.member_id,
    pi.coverage_status
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
LEFT JOIN patient_insurance pi
    ON p.patient_id = pi.patient_id
LEFT JOIN insurance_plans ip
    ON pi.insurance_plan_id = ip.insurance_plan_id
WHERE a.appointment_status = 'Scheduled'
AND (
    pi.patient_id IS NULL
    OR pi.coverage_status <> 'Active'
);

CREATE TABLE authorizations (
    authorization_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    insurance_plan_id INTEGER NOT NULL,
    authorization_number VARCHAR(50),
    authorization_status VARCHAR(30) NOT NULL,
    start_date DATE,
    end_date DATE,

    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),

    FOREIGN KEY (insurance_plan_id)
        REFERENCES insurance_plans(insurance_plan_id)
);

INSERT INTO authorizations
    (patient_id, insurance_plan_id, authorization_number,
     authorization_status, start_date, end_date)
VALUES
    (3, 3, 'AUTH3001', 'Approved', '2026-09-01', '2026-10-31'),
    (5, 6, 'AUTH5001', 'Pending', '2026-09-20', '2026-10-20'),
    (9, 3, 'AUTH9001', 'Expired', '2026-05-01', '2026-06-30');

	SELECT *
FROM authorizations;

SELECT
    p.medical_record_number,
    p.first_name,
    p.last_name,
    ip.payer_name,
    au.authorization_number,
    au.authorization_status,
    au.start_date,
    au.end_date
FROM authorizations au
JOIN patients p
    ON au.patient_id = p.patient_id
JOIN insurance_plans ip
    ON au.insurance_plan_id = ip.insurance_plan_id
WHERE au.authorization_status IN ('Pending', 'Expired');

-- ==========================================
-- ANALYST INVESTIGATION #2
-- Appointment Status Analysis
-- ==========================================

SELECT
    appointment_status,
    COUNT(*) AS total_appointments
FROM appointments
GROUP BY appointment_status
ORDER BY total_appointments DESC;

-- ==========================================
-- ANALYST INVESTIGATION #3
-- Provider Workload Analysis
-- ==========================================

SELECT
    pr.first_name AS provider_first_name,
    pr.last_name AS provider_last_name,
    pr.specialty,
    d.department_name,
    COUNT(a.appointment_id) AS total_appointments
FROM providers pr
JOIN departments d
    ON pr.department_id = d.department_id
LEFT JOIN appointments a
    ON pr.provider_id = a.provider_id
GROUP BY
    pr.provider_id,
    pr.first_name,
    pr.last_name,
    pr.specialty,
    d.department_name
ORDER BY total_appointments DESC;

-- ==========================================
-- ANALYST INVESTIGATION #4
-- Scheduling & Insurance Exception Report
-- ==========================================

SELECT
    p.medical_record_number,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name,
    a.appointment_date,
    a.appointment_time,
    d.department_name,
    pr.first_name AS provider_first_name,
    pr.last_name AS provider_last_name,
    ip.payer_name,
    pi.coverage_status,
    CASE
        WHEN pi.patient_id IS NULL THEN 'Missing Insurance'
        WHEN pi.coverage_status <> 'Active' THEN 'Inactive Insurance'
        ELSE 'Coverage OK'
    END AS insurance_flag
FROM appointments a
JOIN patients p
    ON a.patient_id = p.patient_id
JOIN providers pr
    ON a.provider_id = pr.provider_id
JOIN departments d
    ON pr.department_id = d.department_id
LEFT JOIN patient_insurance pi
    ON p.patient_id = pi.patient_id
LEFT JOIN insurance_plans ip
    ON pi.insurance_plan_id = ip.insurance_plan_id
WHERE a.appointment_status = 'Scheduled'
ORDER BY a.appointment_date;