-- Grouping sets:

-- queries.sql

-- Grouping Sets
COPY (SELECT c.country, cat.category, sum(f.amount) as total_sales FROM "DimCountry" c JOIN "FactSales" f ON c.countryid=f.countryid JOIN "DimCategory" cat ON f.categoryid=cat.categoryid GROUP BY grouping sets ((c.country, cat.category),(c.country),())) TO './grouping_sets.csv' WITH CSV HEADER;

-- Roll up
COPY (SELECT d.year, c.country, SUM(f.amount) AS total_sales FROM "DimDate" d JOIN "FactSales" f ON d.dateid = f.dateid JOIN "DimCountry" c ON f.countryid = c.countryid GROUP BY ROLLUP (d.year, c.country)) TO './roll_up.csv' WITH CSV HEADER;

-- Cube
COPY (SELECT d.year, c.country, AVG(f.amount) AS average_sales FROM "DimDate" d JOIN "FactSales" f ON d.dateid = f.dateid JOIN "DimCountry" c ON f.countryid = c.countryid GROUP BY CUBE (d.year, c.country)) TO './cube.csv' WITH CSV HEADER;

-- MQT (Materialized View)
COPY (SELECT c.country, SUM(fs.amount) AS total_sales FROM "FactSales" fs JOIN "DimCountry" c ON fs.countryid = c.countryid GROUP BY c.country) TO './mqt.csv' WITH CSV HEADER;