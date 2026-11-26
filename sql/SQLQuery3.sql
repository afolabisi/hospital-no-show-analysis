SELECT COUNT(*) AS Total_Appointments 
FROM Silver.hospital_info

select top 5 *
from Silver.hospital_info

-- Overall no-show rate andd volume
select
count(*) as Total_appointments,
sum (case when no_show = 'Yes' Then 1 Else 0 End) as Total_No_Show,
round (100.0 * sum (Case when  No_show = 'Yes' Then 1  else 0 end) / count(*),2) As no_show_RAte_PCT
from Silver.hospital_info

-- No_show rate by timing category
select 
	timing,
	count(*) as appointments,
	sum(case when no_show = 'Yes' Then 1 else 0 end) as No_shows,
	round(100.0 * sum(case when No_show = 'Yes' Then 1 else 0 end)/ count(*), 2) as No_show_rate_pct
from silver.hospital_info
group by Timing
order by No_show_rate_pct desc;

-- Does SMS help inside each waiting time group?
select
	timing,
	SMS_received,
	count(*) as appointments,
	round(100.0 *sum(case when no_show = 'Yes' then 1 else 0 end)/count(*),2) as no_show_rate_pct
from Silver.hospital_info
group by Timing, SMS_received
order by Timing, SMS_received
--------------------------------------------------------
select
	timing,
	SMS_received,
	count(*) as appointments,
	round(100.0 * sum(case when no_show = 'Yes' then 1 else 0 end) / count(*), 2) as no_show_rate_pct,
	round(100.0 * sum(case when no_show = 'No' then 1 else 0 end) / count(*), 2) as show_rate_pct
from Silver.hospital_info
group by Timing, SMS_received
order by Timing, SMS_received;

-- Age group risk profile
select
	Age_Group,
	count(*) as appointment,
	round(100.0 * sum(case when No_show = 'Yes' then 1 else 0 end)/ count(*), 2) as No_Show_Pct
from silver.hospital_info
group by Age_group

--High-risk combination : Long wait + No SMS + Young Patient
select 
	timing,
	age_group,
	SMS_received,
	 count(*) as Appointment,
	 round(100.0 * sum(case when No_show = 'Yes' then 1 else 0 end)/count(*),  2) As No_show_pct
from Silver.hospital_info
group by timing,age_group,SMS_received
order by Appointment desc

-- Top Neighbourhood by number of  no show
select 
Neighbourhood,
count(*) as Total_appintments,
sum(case  when no_show =  'Yes' then 1 else 0 end) as no_show,
round(100.0 * sum(case  when no_show =  'Yes' then 1 else 0 end)  / count(*), 2) as No_show_pct
from Silver.hospital_info
group by Neighbourhood
order by no_show desc

-- Scholarship + Clinical Conditions
select
   Scholarship,
   Hypertension,
   Diabetes,
   count(*) as Appointments,
   round(100.0 * sum(case when no_show = 'Yes' Then 1 else 0 end) / count(*), 2) as no_show_pct
from Silver.hospital_info
group by Scholarship, Hypertension, Diabetes

-- Clear High_risk vs Low risk view
-- Loading  the data into another  table
SELECT *,
    CASE 
        WHEN Timing IN ('Within 30days', 'More than 30days') AND SMS_received = 0 THEN 'High Risk - Long Wait + No SMS'
        WHEN Timing IN ('Within 30days', 'More than 30days') AND SMS_received = 1 THEN 'Medium Risk - Long Wait + SMS'
        WHEN Timing IN ('1-7days') THEN 'Moderate Risk - Short Wait'
        ELSE 'Low Risk - Same Day'
    END AS Risk_Segment
	INTO Gold.APPOINTMENT_TABLE
FROM Silver.hospital_info
