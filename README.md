# ERP-Sourced Sales & Finance Reporting

**Industry:** Manufacturing / Distribution  
**Tools:** SQL (PostgreSQL) · Odoo ERP · Power BI · Python

## Business Problem
A mid-sized distribution/manufacturing company runs its sales, inventory, 
and invoicing through an ERP system (Odoo), but management lacks a 
consolidated view connecting sales performance, customer concentration 
risk, and order fulfillment health. Leadership needs to understand which 
customers and products drive revenue, where revenue is at risk due to 
concentration, and which orders are stalling in the sales pipeline — in 
order to make decisions about customer diversification, sales follow-up 
priorities, and inventory planning.

## Business Questions
1. What percentage of total revenue comes from our top customers, and is 
   the business overly dependent on any single customer?
2. How many quotations are stuck in "draft" status, what's their combined 
   value, and how long have they been sitting unconfirmed?
3. Which products generate the most revenue vs. the most units sold, and 
   where do these two rankings diverge?
4. Which salespeople or sales teams are closing the most confirmed orders 
   vs. leaving the most unconfirmed?
5. Are there confirmed sales orders at risk of delay due to low stock on 
   the ordered products?
6. Is revenue growing, flat, or declining month-over-month, and are there 
   seasonal patterns?

## Data Source
Local Odoo 17 Community ERP instance (Docker), PostgreSQL 15 backend, 
populated with Odoo's built-in demo dataset covering Sales, Invoicing, 
Inventory, and Purchase modules.

## Methodology
1. Data extraction — direct SQL queries against the Odoo Postgres database
2. Analysis — aggregation, joins across master/transactional data, 
   window functions for share-of-total calculations
3. Visualization — Power BI dashboard (in progress)

## Key Insights
### Q1: Revenue Concentration
- **68.7% of total revenue comes from a single customer (Gemini 
  Furniture)** — the top 5 customers combined account for effectively 
  all revenue, with the #2 customer (Joel Willis) at just 13.4%.
- This represents severe customer concentration risk: losing this one 
  account would eliminate more than two-thirds of revenue overnight.

## Business Recommendations
### Q1
- Investigate why revenue is this concentrated — is this a genuinely 
  dominant account, or is the sales team over-relying on one relationship?
- Develop a customer diversification strategy (targeted outreach to 
  grow mid-tier accounts like Joel Willis and Ready Mat) to reduce 
  single-customer dependency.

## Repo Structure
- data/          raw (not committed) and processed data
- sql/           SQL scripts for data extraction/analysis
- notebooks/     Python/R analysis notebooks
- dashboard/     Power BI/Tableau files or exported visuals
- docs/          supporting docs, data dictionary, methodology notes

## How to Reproduce
[To be completed once the full Docker/Odoo setup is finalized]