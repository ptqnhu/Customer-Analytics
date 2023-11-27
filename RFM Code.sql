-- Create stored procedure to get RFM metrics
CREATE PROCEDURE getRFMMetrics @GetDate DATE
AS
    SELECT
        CustomerID
        , DATEDIFF(DAY, MAX(PurchaseDate), @GetDate) AS Recency
        , COUNT(DISTINCT PurchaseDate) AS Frequency
        , SUM(GMV) AS Monetary
    FROM CustomerTransaction CT
    GROUP BY CustomerID
GO


-- Suppose the date of getting data for analysis is Septemper 1st, 2022
EXECUTE getRFMMetrics @GetDate = '2022-09-01'
GO
