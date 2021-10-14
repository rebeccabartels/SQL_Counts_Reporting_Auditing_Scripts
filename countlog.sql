SELECT 
x.MDP_CompanyKey,
x.TotalCustomers,
x.TotalSales,
x.RowNum
FROM (  
     Select 
     sc.MDP_CompanyKey,
     sc.MDPTotalSales,
     sc.TotalSales,
     cc.TotalCustomers,
     cc.MDPTotalCustomers,
     row_number() over (partition by sc.MDP_CompanyKey order by sc.MDP_CompanyKey desc) rowNum
     FROM SalesByMDPKeyCount sc
     INNER JOIN CustomerByMDPKeyCount cc ON cc.MDP_CompanyKey = sc.MDP_CompanyKey

) x
where x.rowNum = 1
