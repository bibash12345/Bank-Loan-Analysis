
--1) FOR KPI’s:

--Count the total number of loan applications
Select COUNT(id) as Total_Loan_Applications from bank_loan_data;

-- Count loan applications for the current month (December 2021)
Select COUNT(id) as Month_To_Date_Loan_Applications from bank_loan_data 
Where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

-- Count loan applications for the previous month (November 2021)
 Select COUNT(id) as Previous_Month_To_Date_Loan_Applications from bank_loan_data 
Where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021;

-- Calculate the total funded loan amount
select SUM(loan_amount) as Total_Funded_Amount From bank_loan_data

-- Calculate the total funded loan amount for the current month (December 2021)
select SUM(loan_amount) as c_Funded_Amount From bank_loan_data
where MONTH(issue_date) = 12 and year(issue_date) = 2021

-- Calculate the total funded loan amount for previous month (November 2021)
select SUM(loan_amount) as Previous_Month_to_date_Funded_Amount From bank_loan_data
where MONTH(issue_date) = 11 and year(issue_date) = 2021

-- Calculate the Total Amount Received
select SUM(total_payment) as Total_Amount_Received from bank_loan_data

-- Calculate the Total Amount Received for December 2021
select SUM(total_payment) as Total_Amount_Received from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

-- Calculate the Total Amount Received for previous month (November 2021)
select SUM(total_payment) as Previous_Month_to_date_Amount_Received from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- Calculate the Average Interest Rate
select Round(AVG(int_rate),4) *100 as Avg_Interest_Rate from bank_loan_data

-- Calculate the Average Interest Rate for December 2021
select Round(AVG(int_rate),4) *100 as Month_to_date_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

-- Calculate the Average Interest Rate for previous month (November 2021)
select Round(AVG(int_rate),4) *100 as Previous_Month_to_date_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

-- Calculate the Average (Debt to income) DTI
select Round(AVG(dti),4)*100 as Avg_DTI from bank_loan_data

-- Calculate the Average (Debt to income) DTI for December 2021
select Round(AVG(dti),4)*100 as Avg_DTI from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

-- Calculate the Average (Debt to income) DTI for previous month (November 2021)
select Round(AVG(dti),4)*100 as Avg_DTI from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

--2) FOR GOOD LOAN ISSUED

--Calculate Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data

--Calculate Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Calculate Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Calculate Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


--3) FOR BAD LOAN ISSUED

--Calculate bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

----Calculate Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

----Calculate Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

----Calculate Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--4) FOR LOAN STATUS
--Calculates the key loan metrics by loan status
	SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

--Calculates the key loan metrics by loan status For December 2021
		SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status











