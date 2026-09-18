use nexatel_customers_database;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/states.csv'  INTO TABLE states  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/billing.csv'  INTO TABLE billing  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/customers.csv'  INTO TABLE customers  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/subscriptions.csv'  INTO TABLE subscriptions  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/plans.csv'  INTO TABLE plans  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/plan_history.csv'  INTO TABLE plan_history  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/contracts.csv'  INTO TABLE contracts  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/devices.csv'  INTO TABLE devices  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/payments.csv'  INTO TABLE payments  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/recharges.csv'  INTO TABLE recharges  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/usage_voice.csv'  INTO TABLE usage_voice  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/usage_sms.csv'  INTO TABLE usage_sms  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/usage_data.csv'  INTO TABLE usage_data  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/network_quality.csv'  INTO TABLE network_quality  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/support_tickets.csv'  INTO TABLE support_tickets  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/complaints.csv'  INTO TABLE complaints  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/customer_feedback.csv'  INTO TABLE customer_feedback  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/retention_campaigns.csv'  INTO TABLE retention_campaigns  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/marketing_campaigns.csv'  INTO TABLE marketing_campaigns  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/employees.csv'  INTO TABLE employees  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/stores.csv'  INTO TABLE stores  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/regions.csv'  INTO TABLE regions  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/cities.csv'  INTO TABLE cities  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/KISHORE/OneDrive/Pictures/Documents/internmo/-NexaTel-Customer-Churn-Analytics-Project/data/raw/data_quality_issue_log.csv'  INTO TABLE data_quality_issue_log  FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;