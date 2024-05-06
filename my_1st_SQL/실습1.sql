SELECT    invoicedate
		  , SUM(unitprice*quantity) AS 매출액
		  , SUM(quantity) AS 주문수량
		  , COUNT(DISTINCT invoiceno) AS 주문건수
		  , COUNT(DISTINCT customerid) AS 주문고객수
FROM	  sales
GROUP BY  invoicedate
ORDER BY  invoicedate;


SELECT	  country
		  , SUM(unitprice*quantity) AS 매출액
		  , SUM(quantity) AS 주문수량
		  , COUNT(DISTINCT invoiceno) AS 주문건수
		  , COUNT(DISTINCT customerid) AS 주문고객수
FROM	  sales
GROUP BY  country;

SELECT	  country
		  , stockcode
		  , SUM(unitprice*quantity) as 매출액
		  , SUM(quantity) AS 주문수량
		  , COUNT(DISTINCT invoiceno) AS 주문건수
		  , COUNT(DISTINCT customerid) AS 주문고객수
FROM	  sales
GROUP BY  country
		  , stockcode;


