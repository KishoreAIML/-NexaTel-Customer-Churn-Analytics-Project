USE nexatel_customers_database;

select * from customers limit 10;

select count(*) as total_customers
from customers;

describe customers;

select city_name, count(*) as number_of_customers
from customers
group by city_name
order by number_of_customers desc
limit 10;

select occupation, count(*) as number_of_customers
from customers
group by occupation
order by number_of_customers desc
limit 10;

select customer_status, count(*) as number_of_customers, ROUND(COUNT(*)/19000, 2) as customers_pct
from customers
group by customer_status
order by number_of_customers desc;

select product_line, count(*) as number_of_customers
from customers
group by product_line
order by number_of_customers desc;

select min(tenure_months) as minimum_tenure_months, max(tenure_months) as maximum_tenure_months
from customers;

-- Churn Rate in each Acquisition Channel
select acquisition_channel, count(*) as number_of_customers,
	sum(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS total_churn_customers,
    ROUND(100 * sum(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*),2) AS total_churn_customers_rate
from customers
group by acquisition_channel
order by total_churn_customers_rate desc;

select acquisition_channel, SUM(tenure_months) as total_tenure_months
from customers
group by acquisition_channel
order by total_tenure_months desc;

-- Churn rate in each product line
select product_line, count(*) as number_of_customers,
	sum(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS total_churn_customers,
    ROUND(100 * sum(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*),2) AS total_churn_customers_rate
from customers
group by product_line
order by total_churn_customers_rate desc;

-- Churn Rate in each customer Segment
select customer_segment, count(*) as number_of_customers,
	sum(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS total_churn_customers,
    ROUND(100 * sum(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*),2) AS total_churn_customers_rate
from customers
group by customer_segment
order by total_churn_customers_rate desc;

-- customers with high income than average income of their segment
with segment_income as(
	select customer_segment, avg(annual_income_inr) as avg_annual_income, count(*) as total_customers
    from customers
    group by customer_segment
)
select c.customer_segment, s.avg_annual_income, count(*) as Number_of_customers, s.total_customers, ROUND(100 * count(*) / s.total_customers,2) AS pct_customers
from customers c
join segment_income s
	ON	c.customer_segment = s.customer_segment
WHERE c.annual_income_inr > s.avg_annual_income
group by c.customer_segment, s.avg_annual_income, s.total_customers
order by s.avg_annual_income desc;



SELECT 
    customer_segment,
    CASE
        WHEN age BETWEEN 1 AND 13 THEN 'Child'
        WHEN age BETWEEN 14 AND 19 THEN 'Teenager'
        WHEN age BETWEEN 20 AND 63 THEN 'Adult'
        WHEN age BETWEEN 64 AND 90 THEN 'Senior'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(*) AS total_customers,
    ROUND( 100 * sum(CASE WHEN customer_status = "Churned" THEN 1 ELSE 0 END) / COUNT(*), 2) AS Churn_Rate
FROM customers
GROUP BY
    customer_segment,
    age_group
ORDER BY
    customer_segment,
    age_group;

-- plans table

select * from plans;

select count(*) as total_plans from plans;

select billing_cycle, count(*) as num_plans
from plans
group by billing_cycle
order by num_plans;

select billing_cycle,
	sum(CASE WHEN is_active = "No" THEN 1 ELSE 0 END) as Churns,
    ROUND(100 * sum(CASE WHEN is_active = "No" THEN 1 ELSE 0 END) / count(*),2) AS churn_rate
from plans
GROUP BY billing_cycle;

select segment, SUM(monthly_charge) as total_monthly_charge
from plans
group by segment
order by total_monthly_charge desc;

select product_line, sum(data_quota_gb) total_data_gb
from plans
group by product_line
order by total_data_gb desc;

select segment, sum(data_quota_gb) total_data_gb
from plans
group by segment
order by total_data_gb desc;

-- Complaints table
select * from complaints;

select 
	cm.status,
	c.customer_status, 
    count(*) AS number_of_customers,
    sum(case  when c.customer_status = "Churned" then 1 else 0 end) as total_churn_customers,
    ROUND(100 * sum(case  when c.customer_status = "Churned" then 1 else 0 end) / sum(count(*)) OVER(partition by cm.status),2) AS Churn_Rate
from complaints cm
INNER JOIN customers c 
	ON cm.customer_id = c.customer_id
group by cm.status,c.customer_status
order by total_churn_customers desc, Churn_Rate desc;

select severity, count(*) as total_resolves
from complaints
where status = "Resolved"
group by severity
order by total_resolves desc;

-- customer feedback
select * from customer_feedback;

select count(*) as total_number_of_feedbacks
from customer_feedback;

select COUNT(*) AS total_feedback_not_given_customers
from customer_feedback cf
RIGHT JOIN customers c
	ON cf.customer_id = c.customer_id
WHERE cf.feedback_id IS NULL;

select min(csat_score) as min_csat, max(csat_score) as max_csat_score, min(nps_score) as min_nps, max(nps_score) as max_nps
from customer_feedback;

select feedback_id, csat_score,
	CASE 
		WHEN csat_score = 5 THEN "Very Satisfied"
		WHEN csat_score = 4 THEN "Satisfied"
		WHEN csat_score = 3 THEN "Neutral"
		WHEN csat_score = 2 THEN "Unsatisfied"
		WHEN csat_score = 1 THEN "Very Unsatisfied"
		ELSE "Unknown"
    END AS csat_category
from customer_feedback;

select 
	count(*) total_responces,
	sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) AS total_satisfied_feedbacks,
    ROUND(100 * sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) AS total_customer_satisfaction_score,
    CASE WHEN ROUND(100 * sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) <= 50 THEN "NEED IMPROVEMENT" ELSE "UNKNOWN" END AS CATEGORY
from customer_feedback;

select feedback_id, nps_score,
	CASE 
		WHEN nps_score IN (9,10) THEN "PROMOTER"
		WHEN nps_score IN (7,8) THEN "PASSIVE"
		WHEN nps_score IN (0,6) THEN "DETRACTER"
		ELSE "Unknown"
    END AS nps_category
from customer_feedback;

select
	count(*) as total_feedbacks,
    sum(case when nps_score IN (9,10) THEN 1 ELSE 0 END) AS total_promoters,
    ROUND((100 * sum(case when nps_score IN (9,10) THEN 1 ELSE 0 END) / count(*)) - (100 * sum(case when nps_score IN (0,6) THEN 1 ELSE 0 END) / COUNT(*)),2) AS net_promoter_score
FROM customer_feedback;

select 
	channel,
	count(*) total_responces,
	sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) AS total_satisfied_feedbacks,
    ROUND(100 * sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) AS total_customer_satisfaction_score,
    CASE WHEN ROUND(100 * sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) <= 50 THEN "NEED IMPROVEMENT" ELSE "UNKNOWN" END AS CATEGORY
from customer_feedback
group by channel
order by total_customer_satisfaction_score desc;

select
	channel,
	count(*) as total_feedbacks,
    sum(case when nps_score IN (9,10) THEN 1 ELSE 0 END) AS total_promoters,
    ROUND((100 * sum(case when nps_score IN (9,10) THEN 1 ELSE 0 END) / count(*)) - (100 * sum(case when nps_score IN (0,6) THEN 1 ELSE 0 END) / COUNT(*)),2) AS net_promoter_score
FROM customer_feedback
group by channel
order by net_promoter_score;

select 
	feedback_category,
	count(*) total_responces,
	sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) AS total_satisfied_feedbacks,
    ROUND(100 * sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) AS total_customer_satisfaction_score,
    CASE WHEN ROUND(100 * sum(CASE WHEN csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) <= 50 THEN "NEED IMPROVEMENT" ELSE "UNKNOWN" END AS CATEGORY
from customer_feedback
group by feedback_category
order by total_customer_satisfaction_score;

select
	feedback_category,
	count(*) as total_feedbacks,
    sum(case when nps_score IN (9,10) THEN 1 ELSE 0 END) AS total_promoters,
    ROUND((100 * sum(case when nps_score IN (9,10) THEN 1 ELSE 0 END) / count(*)) - (100 * sum(case when nps_score IN (0,6) THEN 1 ELSE 0 END) / COUNT(*)),2) AS net_promoter_score
FROM customer_feedback
group by feedback_category
order by net_promoter_score;

select 
	c.customer_segment,
	count(*) total_responces,
	sum(CASE WHEN cf.csat_score IN (5,4) THEN 1 ELSE 0 END) AS total_satisfied_feedbacks,
    ROUND(100 * sum(CASE WHEN cf.csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) AS total_customer_satisfaction_score,
    CASE WHEN ROUND(100 * sum(CASE WHEN cf.csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) <= 50 THEN "NEED IMPROVEMENT" ELSE "UNKNOWN" END AS CATEGORY
from customer_feedback cf
INNER JOIN customers c
 ON cf.customer_id = c.customer_id
group by c.customer_segment
order by total_customer_satisfaction_score;

select 
	c.acquisition_channel,
	count(*) total_responces,
	sum(CASE WHEN cf.csat_score IN (5,4) THEN 1 ELSE 0 END) AS total_satisfied_feedbacks,
    ROUND(100 * sum(CASE WHEN cf.csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) AS total_customer_satisfaction_score,
    CASE WHEN ROUND(100 * sum(CASE WHEN cf.csat_score IN (5,4) THEN 1 ELSE 0 END) / count(*),2) <= 50 THEN "NEED IMPROVEMENT" ELSE "UNKNOWN" END AS CATEGORY
from customer_feedback cf
INNER JOIN customers c
 ON cf.customer_id = c.customer_id
group by c.acquisition_channel
order by total_customer_satisfaction_score;

-- Subscriptions table
select * from subscriptions;

select count(*) as total_no_subscriptions
from subscriptions;

select billing_cycle,count(*) as total_no_subscriptions
from subscriptions
group by billing_cycle;

select billing_cycle, min(monthly_charge_inr) as mim_charge_amount,
max(monthly_charge_inr) as max_charge_amount
from subscriptions
group by billing_cycle;

select subscription_status, 
	count(*) as no_subscrptions
from subscriptions
group by subscription_status
order by no_subscrptions desc;

select billing_cycle,
	sum(monthly_charge_inr) as total_revenue,
    ROUND(100 * sum(monthly_charge_inr) / sum(sum(monthly_charge_inr)) over(), 2) as pct_revenue
from subscriptions
group by billing_cycle
order by total_revenue desc;

select s.billing_cycle,
	round(100 * sum(case when c.customer_status = "Churned" THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
from subscriptions s
INNER JOIN customers c 
	ON s.customer_id = c.customer_id
group by s.billing_cycle
order by churn_rate;

select s.billing_cycle,s.subscription_status,
	round(100 * sum(case when c.customer_status = "Churned" THEN 1 ELSE 0 END) / COUNT(*),2) AS churn_rate
from subscriptions s
INNER JOIN customers c 
	ON s.customer_id = c.customer_id
group by s.billing_cycle,s.subscription_status
order by churn_rate;

describe subscriptions;

SET SQL_SAFE_UPDATES = 0;

UPDATE subscriptions
SET start_date = STR_TO_DATE(start_date, "%d-%m-%Y")
where subscription_id is not null;

ALTER TABLE subscriptions
MODIFY start_date DATE;

UPDATE subscriptions
SET end_date = STR_TO_DATE(end_date, "%d-%m-%Y")
where subscription_id is not null;

ALTER TABLE subscriptions
MODIFY end_date DATE;

SET SQL_SAFE_UPDATES = 1;

select billing_cycle, round(avg(DATEDIFF(end_date,start_date)) / 365, 2) AS max_tenure_days
from subscriptions
where subscription_status = "Terminated"
group by billing_cycle;

select * from cities;
select count(*) from cities;

select * from stores;
select count(*) from stores;

select s.store_name,
s.store_type, 
	round(100 * sum(case when c.customer_status = "Churned" then 1 else 0 end) / count(*),2) as churn_rate
from customers c
inner join cities ct
	ON c.city_id = ct.city_id
INNER JOIN stores s 
	ON ct.city_id = s.city_id
group by s.store_name, s.store_type
order by churn_rate desc
limit 10;

select s.store_type, 
	round(100 * sum(case when c.customer_status = "Churned" then 1 else 0 end) / count(*),2) as churn_rate
from customers c
inner join cities ct
	ON c.city_id = ct.city_id
INNER JOIN stores s 
	ON ct.city_id = s.city_id
group by s.store_type
order by churn_rate desc;



