SELECT    invoicedate
		  , SUM(unitprice*quantity) AS �����
		  , SUM(quantity) AS �ֹ�����
		  , COUNT(DISTINCT invoiceno) AS �ֹ��Ǽ�
		  , COUNT(DISTINCT customerid) AS �ֹ�����
FROM	  sales
GROUP BY  invoicedate
ORDER BY  invoicedate;


SELECT	  country
		  , SUM(unitprice*quantity) AS �����
		  , SUM(quantity) AS �ֹ�����
		  , COUNT(DISTINCT invoiceno) AS �ֹ��Ǽ�
		  , COUNT(DISTINCT customerid) AS �ֹ�����
FROM	  sales
GROUP BY  country;

SELECT	  country
		  , stockcode
		  , SUM(unitprice*quantity) as �����
		  , SUM(quantity) AS �ֹ�����
		  , COUNT(DISTINCT invoiceno) AS �ֹ��Ǽ�
		  , COUNT(DISTINCT customerid) AS �ֹ�����
FROM	  sales
GROUP BY  country
		  , stockcode;


