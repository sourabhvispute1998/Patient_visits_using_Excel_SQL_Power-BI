create database Healthcare_Patient_Visits_Revenue_Analysis;
use Healthcare_Patient_Visits_Revenue_Analysis;
create table patient_visits_cleaned_3(
visit_id int primary key,
patient_id varchar (50),
department varchar (50),
visit_date date,
billing_amount decimal (10,2),
payment_status varchar(10),
doctor_name varchar(50),
month varchar (10));

INSERT INTO patient_visits_cleaned_3
(visit_id, patient_id, department, visit_date, billing_amount, payment_status, doctor_name, month)
VALUES
(1, 'P001', 'Cardiology', '2024-01-01', 25000, 'Paid', 'Dr. Mehta', 'Jan-2024'),
(2, 'P002', 'Orthopedics', '2024-01-05', 18000, 'Pending', 'Dr. Rao', 'Jan-2024'),
(3, 'P003', 'Neurology', '2024-01-12', 32000, 'Paid', 'Dr. Sharma', 'Jan-2024'),
(4, 'P004', 'Cardiology', '2024-02-15', 27000, 'Paid', 'Dr. Mehta', 'Feb-2024'),
(5, 'P005', 'Orthopedics', '2024-02-20', 15000, 'Paid', 'Dr. Rao', 'Feb-2024'),
(6, 'P006', 'Neurology', '2024-02-25', 29000, 'Pending', 'Dr. Sharma', 'Feb-2024'),
(7, 'P007', 'Cardiology', '2024-03-02', 26000, 'Paid', 'Dr. Mehta', 'Mar-2024'),
(8, 'P008', 'Orthopedics', '2024-03-10', 17000, 'Paid', 'Dr. Rao', 'Mar-2024'),
(9, 'P009', 'Neurology', '2024-03-18', 31000, 'Paid', 'Dr. Sharma', 'Mar-2024'),
(10, 'P010', 'Cardiology', '2024-03-28', 24000, 'Pending', 'Dr. Mehta', 'Mar-2024');

select * from patient_visits_cleaned_3

-- total revenue of all doctors
SELECT SUM(billing_amount) AS total_revenue
FROM patient_visits_cleaned_3
WHERE payment_status = 'Paid';

-- revenue by department
select department,
	sum(billing_amount) as department_revenue
    from patient_visits_cleaned_3
    where payment_status = 'Paid'
    group by department
    order by department asc;
    
-- montly revenue trend
select month,
	sum(billing_amount) as monthly_revenue
    from patient_visits_cleaned_3
    where payment_status = 'Paid'
    group by month
    order by month (1);

-- pending payments
select department,
	count(*) as pending_cases,
    sum(billing_amount) AS pending_amount
from patient_visits_cleaned_3
where payment_status = 'pending'
group by department;







