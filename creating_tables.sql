
drop table if exists doctors_examinations ;
drop table if exists wards ;
drop table if exists donations ;
drop table if exists professors;
drop table if exists interns;

drop table if exists departments ;
drop table if exists examinations ;
drop table if exists doctors ;
drop table if exists sponsors ;




CREATE TABLE IF NOT EXISTS departments (
    id SERIAL PRIMARY KEY,
    building INT NOT NULL,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS examinations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS wards (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    places INT NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS doctors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    premium INT NOT NULL DEFAULT 0 CHECK (premium >= 0),
    salary INT NOT NULL CHECK (salary > 0)
);

CREATE TABLE IF NOT EXISTS sponsors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS doctors_examinations (
    id SERIAL PRIMARY KEY,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE,
    examination_id INT,
    FOREIGN KEY (examination_id) REFERENCES examinations(id) ON DELETE CASCADE,
    ward_id INT,
    FOREIGN KEY (ward_id) REFERENCES wards(id) ON DELETE CASCADE,
    start_time TIME NOT NULL CHECK (start_time >= '08:00' AND start_time <= '18:00'),
    end_time TIME NOT NULL CHECK (end_time > start_time)
);

CREATE TABLE IF NOT EXISTS donations (
    id SERIAL PRIMARY KEY,
    amount INT NOT NULL,
    date DATE CHECK (date < CURRENT_DATE),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE,
    sponsor_id INT,
    FOREIGN KEY (sponsor_id) REFERENCES sponsors(id) ON DELETE CASCADE
);

CREATE table if NOT EXISTS professors(
id SERIAL primary key,
doctor_id int
);

CREATE table if NOT EXISTS interns(
id SERIAL primary key,
doctor_id int
);


INSERT INTO departments (building, name) VALUES
(1, 'Cardiology'),
(1, 'Neurology'),
(2, 'Orthopedics'),
(2, 'Pediatrics'),
(3, 'Oncology'),
(3, 'Dermatology'),
(4, 'Gastroenterology'),
(4, 'Hematology'),
(5, 'Urology'),
(6, 'Ophthalmology');


INSERT INTO examinations (name) VALUES
('MRI'),
('CT Scan'),
('Ultrasound'),
('X-Ray'),
('Blood Test'),
('EKG'),
('Endoscopy'),
('Colonoscopy'),
('Biopsy'),
('Physical Examination');


INSERT INTO wards (name, places, department_id) VALUES
('Ward 1', 20, 1),
('Ward 2', 15, 1),
('Ward 3', 25, 1),
('Ward 4', 18, 2),
('Ward 5', 22, 2),
('Ward 6', 30, 2),
('Ward 7', 20, 3),
('Ward 8', 25, 3),
('Ward 9', 15, 4),
('Ward 10', 20, 4),
('Ward 11', 17, 4),
('Ward 12', 15, 5),
('Ward 13', 13, 5),
('Ward 14', 10, 5),
('Ward 15', 16, 6),
('Ward 16', 18, 6),
('Ward 17', 19, 6);


INSERT INTO doctors (name, surname, premium, salary) VALUES
('John', 'Doe', 500, 6000),
('Jane', 'Smith', 600, 7000),
('Michael', 'Johnson', 700, 8000),
('Emily', 'Brown', 550, 6500),
('David', 'Wilson', 600, 7000),
('Jennifer', 'Taylor', 650, 7500),
('Christopher', 'Anderson', 550, 6500),
('Jessica', 'Thomas', 700, 8000),
('Daniel', 'Jackson', 600, 7000),
('Elizabeth', 'White', 550, 6500)
('Carl', 'Wolker' , 0, 1200),
('Tom' , 'Cruse' , 100, 1100),
('Jeremy' , 'Clarkson' , 50, 1300);

INSERT INTO professors (doctor_id VALUES
(2),
(4),
(6);

insert into interns(doctor_id) VALUES
(11),
(12),
(13);

-- Insert data into sponsors table
INSERT INTO sponsors (name) VALUES
('XYZ Corporation'),
('ABC Foundation'),
('Community Health Services'),
('Smith Family Trust'),
('Johnson Enterprises');


INSERT INTO donations (amount, date, department_id, sponsor_id) VALUES
(1000, '2024-04-22', 1, 1),
(2000, '2024-04-22', 2, 2),
(1500, '2024-04-21', 3, 3),
(2500, '2024-04-20', 4, 4),
(1800, '2024-04-19', 5, 5),
(1200, '2024-04-18', 6, 1),
(3000, '2024-04-17', 7, 2),
(1750, '2024-04-16', 8, 3),
(2200, '2024-04-15', 9, 4),
(2800, '2024-04-14', 10, 4),
(900, '2024-04-18', 1, 1),
(300, '2024-04-17', 2, 2),
(175, '2024-04-16', 3, 3),
(220, '2024-04-15', 9, 4),
(280, '2024-04-14', 10, 4);


INSERT INTO doctors_examinations (doctor_id, examination_id, ward_id, start_time, end_time) VALUES
(1, 1, 2, '09:00', '11:00'),
(2, 2, 1, '10:00', '12:00'),
(3, 3, 4, '11:00', '13:00'),
(4, 4, 5, '12:00', '14:00'),
(5, 5, 7, '13:00', '15:00'),
(6, 6, 8, '14:00', '16:00'),
(7, 7, 10, '15:00', '17:00'),
(8, 8, 11, '16:00', '18:00'),
(9, 9, 14, '09:00', '11:00'),
(10, 10, 15, '10:00', '12:00')
(11, 2, 1, '10:00', '12:00')
(12, 4, 5, '12:00', '14:00'),
(13, 6, 8, '14:00', '16:00');

