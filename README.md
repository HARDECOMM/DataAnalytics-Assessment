# DataAnalytics-Assessment

Don't print out this..

# Question 1

*Query to analyze savings and investment plans*

- The query analyzes savings and investment plans for customers.

I joined the savings_savingsaccount and plans_plan tables to get the relevant data.

I used a CASE statement to categorize the plans as 'Savings' or 'Investment'.

I calculated the number of savings and investment plans for each customer.

I calculated the total deposits for each customer.

# Question 2

*Query to analyze transaction frequency*

- The query analyzes the frequency of transactions for customers.

I used a Common Table Expression (CTE) to calculate the average monthly transactions for each customer.

I categorized the customers into 'High Frequency', 'Medium Frequency', and 'Low Frequency' based on their average monthly transactions.

# Question 3

*Query to analyze inactivity*

- The query analyzes the inactivity of customers.

I calculated the last transaction date for each customer.

I calculated the number of days since the last transaction (inactivity days).

I filters customers who have not made a transaction in the last year.

# Question 4

*Query to estimate customer lifetime value (CLV)*

- The query estimates the customer lifetime value (CLV) for customers.

I calculated the tenure of the customer in months.

I calculated the total number of transactions for each customer.

It estimated the CLV using a formula that takes into account the total transactions, tenure, and average transaction value.

## Challenges

- One of the great challenge was the id in owner and customer columns, they are string data types which I couldn't be able to make available based on the samples.
  
- my second challenge was actually about encoding challenges which i later got through with try and errors.

- I was challenged with errors during my codes, but with the help of ChatGPT and AI and my domain knowledge in Sql, i was able to surpass my challenges.

- in addition to my first challenge the code you provide was actually wrong encoded in the table creation, you define utf8 instead of utf8_mb4.
