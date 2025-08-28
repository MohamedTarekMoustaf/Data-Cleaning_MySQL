# Data-Cleaning_MySQL

Data Cleaning with MySQL

This project demonstrates data cleaning techniques using MySQL on a dataset of company layoffs. The goal is to transform raw, inconsistent data into a clean, structured, and reliable dataset suitable for analysis.

🚀 Project Overview

The SQL script includes the following major steps:

Removing Duplicates

Created staging tables to preserve raw data.

Used DISTINCT and row identifiers to filter out duplicate records.

Standardizing Data

Trimmed whitespace in text fields (company, country).

Standardized categorical values (e.g., merged "Crypto*" into "Crypto").

Converted date from text format to MySQL DATE type.

Handling Nulls & Missing Values

Identified records with missing or blank values in key fields.

Replaced missing industries by referencing other rows from the same company.

Deleted rows with no valid layoff data.

Final Cleanup

Dropped helper columns (e.g., row_num).

Produced a clean and analysis-ready table.

📂 File Structure

Data Cleaning_MySQL.sql → Main SQL script containing all steps for data cleaning.

🛠️ Technologies Used

Database: MySQL

Language: SQL

📊 Example Use Cases

This workflow can be applied to:

Cleaning HR or finance datasets with duplicate/missing entries.

Preparing datasets for reporting and BI tools.

Ensuring consistency before data visualization or machine learning.

▶️ How to Use

Clone the repository:

git clone https://github.com/your-username/data-cleaning-mysql.git


Import your raw dataset into MySQL.

Run the SQL script step by step.

Query the cleaned dataset from layoffs_stagging2.

📌 Notes

The dataset used here is a layoff dataset (companies, industries, dates, etc.).

Ensure you have the necessary privileges to create and modify tables.
