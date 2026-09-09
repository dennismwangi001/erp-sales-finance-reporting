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
   ### Q2: Stalled Quotations Pipeline
- 4 quotations remain unconfirmed, totaling 5,470 KSh in pipeline value.
- 3 of these (5,092.5 KSh) have been stalled for 52 days — concentrated 
  in just two accounts: Ready Mat and Acme Corporation.
  ### Q3: Revenue vs. Units Sold Divergence
- Revenue and volume rankings diverge: Acoustic Bloc Screens leads in 
  revenue (15,405 KSh) despite moderate volume (53 units), while Virtual 
  Interior Design and Virtual Home Staging sell in much higher volume 
  (74 and 60 units) but generate far less revenue each.
- This suggests a meaningful price-per-unit/margin difference between 
  "volume" products and "revenue" products.
  ### Q4: Sales Rep Performance
- Marc Demo: 15 confirmed orders (20,017 KSh), 2 unconfirmed — ~88% 
  close rate.
- Mitchell Admin: 4 confirmed orders (7,643.5 KSh), 2 unconfirmed — ~67% 
  close rate.
- Note: sample sizes are small (demo data); ratios are illustrative of 
  method, not statistically robust conclusions.

## Business Recommendations
### Q1
- Investigate why revenue is this concentrated — is this a genuinely 
  dominant account, or is the sales team over-relying on one relationship?
- Develop a customer diversification strategy (targeted outreach to 
  grow mid-tier accounts like Joel Willis and Ready Mat) to reduce 
  single-customer dependency.
### Q2
- Review the Ready Mat and Acme Corporation accounts specifically — 
  either re-engage to convert these quotations or formally close them 
  out to keep pipeline reporting accurate.
  ### Q3
- Confirm margin data (not available in this dataset) before treating 
  high-revenue products as automatically higher-priority — revenue alone 
  doesn't confirm profitability.
- Consider whether sales effort on high-volume, lower-revenue items should 
  be reallocated toward higher-revenue products, pending margin analysis.
  ### Q4
- Investigate the gap in Mitchell Admin's conversion rate — determine 
  whether it reflects customer mix, experience, or a follow-up process 
  gap, and address accordingly.

## Repo Structure
- data/          raw (not committed) and processed data
- sql/           SQL scripts for data extraction/analysis
- notebooks/     Python/R analysis notebooks
- dashboard/     Power BI/Tableau files or exported visuals
- docs/          supporting docs, data dictionary, methodology notes

## How to Reproduce
[To be completed once the full Docker/Odoo setup is finalized]
