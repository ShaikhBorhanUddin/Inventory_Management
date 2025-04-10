# Q1: What are the top 5 products with the highest total revenue, considering OrderItemQuantity and PerUnitPrice?
## Solution
```SQL
SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalRevenue DESC
LIMIT 5;
```
## Output
|productid|productname                         |totalrevenue|
|---------|------------------------------------|------------|
|P359     |PNY SSD9SC240GMDA-RB                |600155.00   |
|P246     |Samsung MZ-V6E500                   |550487.00   |
|P304     |Kingston Fury (HX316C10FB/8) 8 GB   |389855.70   |
|P273     |Samsung MZ-75E120B/AM               |344872.35   |
|P267     |Western Digital WD5000AACS          |328038.42   |
## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%201.png?raw=true)
# Q2: Which customers have spent the most money, and what is their total spending? (Top 10 customers by total spending)
## Solution
```SQL
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalSpending
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalSpending DESC
LIMIT 10;
```
## Output
|customerid|customername        |totalspending|
|----------|--------------------|-------------|
|2659      |Shields Seffi       |600155.00    |
|2546      |Bill Stein          |550487.00    |
|2604      |Daina Combs         |389855.70    |
|2573      |Mac Mckay           |344872.35    |
|2567      |Alessandra Estrada  |328038.42    |
|2401      |Samara Barnett      |323400.00    |
|2607      |Darron Robertson    |307683.51    |
|2456      |Glinda Lambert      |302398.88    |
|2513      |Herman Stokes       |300139.18    |
|2410      |Reva Fuller         |292382.07    |
## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%202.png?raw=true)
# Q3: Which product category generates the top 3 highest total revenue?
## Solution
```SQL
SELECT 
    p.CategoryName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 3;
```
## Output
|categoryname|totalrevenue|
|------------|------------|
|Storage     |10712932.17 |
|Video Card  |5746481.52  |
|Mother Board|5555189.14  |
## Visualization
![dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%203.png?raw=true)
# Q4: Which month had the highest total sales revenue?
## Solution
```SQL
SELECT 
    TO_CHAR(o.OrderDate, 'YYYY-MM') AS OrderMonth, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY OrderMonth
ORDER BY TotalRevenue DESC
LIMIT 1;
```
## Output
|ordermonth|totalrevenue|
|----------|------------|
|2017-02   |4573355.78  |

# Q5: Which warehouse has handled the highest total order quantity?
## Solution
```SQL
SELECT 
    w.WarehouseID, 
    w.WarehouseName, 
    SUM(od.OrderItemQuantity) AS TotalOrderQuantity
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
JOIN Warehouse w ON p.ProductID = p.ProductID
GROUP BY w.WarehouseID, w.WarehouseName
ORDER BY TotalOrderQuantity DESC
LIMIT 1;
```
## Output
|warehouseid|warehousename  |totalorderquantity|
|-----------|---------------|------------------|
|102        |Southlake Texas|35696             |
|103        |Southlake Texas|35696             |
|104        |Southlake Texas|35696             |
|105        |Southlake Texas|35696             |
|106        |Southlake Texas|35696             |
|107        |Southlake Texas|35696             |
|108        |Southlake Texas|35696             |
|109        |Southlake Texas|35696             |
|110        |Southlake Texas|35696             |
|101        |Southlake Texas|35696             |

# Q6: Which employee has processed the highest number of orders?
## Solution
```SQL
SELECT 
    e.EmployeeID, 
    e.EmployeeName, 
    COUNT(o.OrderID) AS TotalOrdersProcessed
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN Employee e ON c.CustomerID = c.CustomerID
GROUP BY e.EmployeeID, e.EmployeeName
ORDER BY TotalOrdersProcessed DESC
LIMIT 1;
```
## Output
|employeeid|employeename|totalordersprocessed|
|----------|------------|--------------------|
|6309      |Summer Payne|400                 |

# Q7: What is the average order value (AOV) per customer?
## Solution
```SQL
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    AVG(od.OrderItemQuantity * od.PerUnitPrice) AS AvgOrderValue
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY AvgOrderValue DESC;
```
## Output
|customerid|customername        |avgordervalue         |
|----------|--------------------|----------------------|
|2659      |Shields Seffi       |600155.000000000000   |
|2546      |Bill Stein          |550487.000000000000   |
|2604      |Daina Combs         |389855.700000000000   |
|2573      |Mac Mckay           |344872.350000000000   |
|2567      |Alessandra Estrada  |328038.420000000000   |
|2401      |Samara Barnett      |323400.000000000000   |
|2607      |Darron Robertson    |307683.510000000000   |
|2456      |Glinda Lambert      |302398.880000000000   |
|2513      |Herman Stokes       |300139.180000000000   |
|2410      |Reva Fuller         |292382.070000000000   |
|2318      |Maurice Mahoney     |289984.050000000000   |
|2568      |Sherron Flores      |275000.000000000000   |
|2492      |Maud Cohen          |266909.180000000000   |
|2378      |Elwood Hampton      |259421.630000000000   |
|2529      |Kandi Holden        |254598.660000000000   |
|2575      |Quinton Woods       |252944.010000000000   |
|2394      |Twanna Cleveland    |248838.020000000000   |
|2562      |Tereasa Padilla     |240799.140000000000   |
|2571      |Shelia Cain         |237498.750000000000   |
|2392      |Jannette Henry      |235923.000000000000   |
|2660      |Simard Kramer       |235304.000000000000   |
|2418      |Carlyn Calderon     |231423.240000000000   |
|2485      |Shelia Brewer       |213601.660000000000   |
|2490      |Kristle Cain        |211697.080000000000   |
|2611      |Josiah Beasley      |210900.000000000000   |
|2687      |Tippett Jeanette    |208498.610000000000   |
|2396      |Jon Petersen        |203880.000000000000   |
|2382      |Jannet Elliott      |201988.890000000000   |
|2530      |Lashonda Cunningham |198611.270000000000   |
|2360      |Ophelia Hurst       |197248.500000000000   |
|2458      |Amado Jefferson     |196927.080000000000   |
|2516      |Lucius Abbott       |193598.900000000000   |
|2391      |Charlsie Lindsey    |186199.020000000000   |
|2606      |Arlette Thornton    |178798.510000000000   |
|2634      |Rachael Maggie      |175687.760000000000   |
|2586      |Dorotha Wong        |173270.790000000000   |
|2688      |Torrence Jack       |172798.560000000000   |
|2476      |Felicita Alston     |172479.020000000000   |
|2655      |Salter Jason        |171585.960000000000   |
|2486      |Jeri Randall        |171585.960000000000   |
|2572      |Charlene Booker     |170948.700000000000   |
|2683      |Tejeda Lenora       |168805.670000000000   |
|2362      |Birgit Stephenson   |168197.680000000000   |
|2554      |Enriqueta Odom      |166798.610000000000   |
|2591      |Cleo English        |159598.670000000000   |
|2578      |Jackson Morin       |159528.940000000000   |
|2665      |Smith Leigh Ann     |158398.680000000000   |
|2519      |Dick Lamb           |154654.560000000000   |
|2341      |Mack Morse          |154345.800000000000   |
|2650      |Ruiz Ricardo        |151827.480000000000   |
|2370      |Trang Mcconnell     |145991.970000000000   |
|2592      |Liana Pena          |144477.600000000000   |
|2415      |DellWilkinson       |136798.860000000000   |
|2680      |Szabo Andrew        |135156.610000000000   |
|2452      |Heike Emerson       |134892.000000000000   |
|2552      |Isabella Ortega     |133398.160000000000   |
|2473      |Yolando Wilkerson   |130993.770000000000   |
|2699      |Lucy Cechtelar      |129052.430000000000   |
|2498      |Kina Larsen         |128879.100000000000   |
|2644      |Roby Lori           |128509.440000000000   |
|2393      |Margart Mccall      |127601.080000000000   |
|2616      |Amber Brady         |127498.500000000000   |
|2420      |Delpha Golden       |124525.830000000000   |
|2357      |Wallace Dillard     |123231.180000000000   |
|2563      |Merrilee Phillips   |122823.720000000000   |
|2598      |Mozelle Schneider   |121231.590000000000   |
|2539      |Johnie Rojas        |120081.120000000000   |
|2583      |Evelina Campbell    |119444.540000000000   |
|2691      |True Edward         |119362.530000000000   |
|2624      |Peterson Ebonee     |119212.890000000000   |
|2515      |Lauren Williamson   |118799.010000000000   |
|2331      |Marlene Odom        |118148.610000000000   |
|2536      |Shamika Bauer       |117776.170000000000   |
|2664      |Smith John          |117565.280000000000   |
|2495      |Sybil Harding       |117383.330000000000   |
|2469      |Christal Grant      |116549.160000000000   |
|2651      |Saada Adell         |116549.160000000000   |
|2339      |Gino Pickett        |114722.300000000000   |
|2649      |RoupSimon           |113186.920000000000   |
|2612      |Annabelle Butler    |112939.970000000000   |
|2596      |Elly Salinas        |112615.070000000000   |
|2450      |Lino Noble          |111333.450000000000   |
|2304      |Shyla Ortiz         |108798.720000000000   |
|2312      |Guillaume Jackson   |107800.000000000000   |
|2618      |Patronick Lucas     |106871.390000000000   |
|2454      |Doretha Tyler       |106577.860000000000   |
|2358      |Gia Boyle           |106168.580000000000   |
|2545      |Myrna Romero        |104549.180000000000   |
|2344      |Classie Norris      |102699.210000000000   |
|2314      |Dianne Derek        |101800.590000000000   |
|2566      |Basilia Downs       |101498.600000000000   |
|2663      |Smith Joe           |101218.600000000000   |
|2413      |Audrea Hayden       |100799.160000000000   |
|2316      |Geraldine Martin    |100657.440000000000   |
|2620      |Smith Martin        |99748.670000000000    |
|2389      |Ja Whitfield        |99526.570000000000    |
|2426      |Janeen Holt         |99448.830000000000    |
|2653      |Sadki Nore          |99403.590000000000    |
|2404      |Evita Dickerson     |98636.790000000000    |
|2463      |Weldon Robinson     |97288.620000000000    |
|2488      |Kenneth Simmons     |96518.730000000000    |
|2551      |Jadwiga Morrison    |95999.200000000000    |
|2451      |Kathie Jordan       |95934.280000000000    |
|2448      |Jimmy Weber         |95272.660000000000    |
|2523      |Bobby Wilson        |94983.240000000000    |
|2405      |Aundrea Barry       |94919.580000000000    |
|2577      |Deneen Hays         |94804.620000000000    |
|2493      |Rolanda Vang        |94468.660000000000    |
|2411      |Marica Henderson    |94240.610000000000    |
|2609      |Charlsie Carey      |93999.060000000000    |
|2681      |Tannen Biff         |93648.290000000000    |
|2309      |Christian Cage      |93396.420000000000    |
|2347      |Verena Hopper       |93136.710000000000    |
|2445      |Keesha Cohen        |92993.180000000000    |
|2439      |So Hardin           |92854.540000000000    |
|2321      |Dianne Sen          |92684.000000000000    |
|2605      |Lashunda Davidson   |92654.130000000000    |
|2403      |Melita Holcomb      |92607.480000000000    |
|2478      |Gabriel Pollard     |92244.500000000000    |
|2531      |Roxanne Michalkow   |91509.810000000000    |
|2446      |Elvera Benson       |91130.530000000000    |
|2384      |Francisco Cummings  |91001.640000000000    |
|2565      |Napoleon Cruz       |90497.160000000000    |
|2676      |Strong Caitrin      |89930.940000000000    |
|2367      |Agustina Conner     |89678.820000000000    |
|2541      |Teressa Hewitt      |89609.130000000000    |
|2481      |Aaron Holder        |88774.630000000000    |
|2442      |Ha Lowe             |88058.810000000000    |
|2377      |Felix Ferguson      |87599.270000000000    |
|2617      |Wendell Massey      |86993.620000000000    |
|2444      |Melissa Nichols     |86638.800000000000    |
|2639      |Roberson May        |85916.670000000000    |
|2600      |Vernia Hayes        |85386.580000000000    |
|2556      |Herb Sloan          |85070.150000000000    |
|2678      |Sullivan Timothy    |85048.950000000000    |
|2630      |Power Morissa       |84966.480000000000    |
|2585      |Aleshia Reese       |84624.690000000000    |
|2642      |Robinson Cherly     |84376.530000000000    |
|2307      |Matthias Cruise     |83818.730000000000    |
|2570      |Percy Hernandez     |83536.830000000000    |
|2407      |Kellee Molina       |83426.150000000000    |
|2453      |Princes Jones       |83314.690000000000    |
|2597      |Ginny Carlson       |82399.200000000000    |
|2306      |Matthias Hannah     |81339.320000000000    |
|2322      |Maurice Daltrey     |81037.810000000000    |
|2435      |Aurea Sanders       |80733.660000000000    |
|2601      |Ismael Solomon      |79273.260000000000    |
|2526      |Kenton Harrell      |79199.250000000000    |
|2674      |Steans Tyrone       |78840.870000000000    |
|2613      |Ed Mueller          |78551.460000000000    |
|2614      |Colleen Estrada     |77290.860000000000    |
|2371      |Nada West           |76664.060000000000    |
|2425      |Roseline Hill       |75899.310000000000    |
|2625      |Petingill Shana     |75130.370000000000    |
|2346      |Isreal Rose         |74254.960000000000    |
|2395      |Bronwyn Horn        |74233.990000000000    |
|2303      |Fern Head           |73668.080000000000    |
|2505      |Carita Mcintyre     |73546.560000000000    |
|2518      |Tamisha Vargas      |73488.450000000000    |
|2580      |Adah Myers          |73078.740000000000    |
|2615      |Nikia Kent          |72870.810000000000    |
|2670      |Spirea Kelley       |72128.000000000000    |
|2336      |Trula Buckley       |72029.020000000000    |
|2652      |SaarBeckles, Melinda|71279.120000000000    |
|2319      |Maurice Hasan       |71099.210000000000    |
|2588      |Hassan Rivers       |70846.360000000000    |
|2349      |Gertrude Cooke      |70788.300000000000    |
|2330      |Mireya Cochran      |69919.080000000000    |
|2698      |Voldemort Lord      |69699.180000000000    |
|2635      |Rarrick Quinn       |68264.000000000000    |
|2343      |Gabrielle Dennis    |67303.950000000000    |
|2693      |Turpin Jumil        |67140.300000000000    |
|2408      |Ronny Sykes         |67140.300000000000    |
|2449      |Mae Wilkinson       |66778.950000000000    |
|2472      |Heidy Massey        |66728.000000000000    |
|2399      |Eden Burke          |65687.080000000000    |
|2525      |Ginger Atkinson     |64958.880000000000    |
|2302      |Lavera Emerson      |64478.760000000000    |
|2414      |Neda Mcfadden       |64346.110000000000    |
|2527      |Misti Velazquez     |64327.800000000000    |
|2366      |Jessika Merritt     |63865.700000000000    |
|2342      |Eboni Jarvis        |63599.470000000000    |
|2385      |Ermelinda Benton    |62723.700000000000    |
|2436      |Stacia Rutledge     |62428.700000000000    |
|2301      |Flor Stone          |62038.680000000000    |
|2626      |Petrowsky Thelma    |60894.050000000000    |
|2574      |Jamison Merritt     |60143.440000000000    |
|2361      |Ciara Flowers       |59400.000000000000    |
|2480      |Thomasena Pickett   |59399.460000000000    |
|2466      |Stefan Walters      |58514.170000000000    |
|2558      |Gaynell Burton      |58463.280000000000    |
|2512      |Tandy House         |58372.500000000000    |
|2432      |Monnie Walker       |57748.600000000000    |
|2497      |Maximo Ortega       |57420.000000000000    |
|2398      |Avis Moore          |57303.540000000000    |
|2462      |Lacey Walters       |55722.260000000000    |
|2532      |Phuong Sanders      |55631.240000000000    |
|2467      |Arlene Elliott      |55555.600000000000    |
|2579      |Margo Hoffman       |54871.240000000000    |
|2337      |Sasha Wallace       |54518.840000000000    |
|2427      |Tory Avila          |54389.260000000000    |
|2637      |Rhoads Thomas       |54167.260000000000    |
|2576      |Cathey Mcdowell     |54022.650000000000    |
|2429      |Jazmin Burch        |52898.230000000000    |
|2697      |Villanueva Noah     |52685.160000000000    |
|2489      |Dulce Matthews      |52665.480000000000    |
|2593      |Francina Slater     |52539.290000000000    |
|2584      |Thi Maxwell         |51679.200000000000    |
|2643      |Robinson Elias      |51527.240000000000    |
|2428      |Keila Slater        |51471.520000000000    |
|2517      |Beatrice Ford       |51464.270000000000    |
|2386      |Lasonya Beard       |51191.280000000000    |
|2317      |Guillaume Edwards   |50658.510000000000    |
|2656      |Sander Kamrin       |49933.900000000000    |
|2402      |Nadia Sawyer        |49298.550000000000    |
|2640      |Robertson Peter     |48390.000000000000    |
|2677      |Sullivan Kissy      |48139.170000000000    |
|2654      |Sahoo Adil          |48137.290000000000    |
|2383      |Fae Glenn           |48099.260000000000    |
|2465      |Jame Calhoun        |47939.530000000000    |
|2441      |Loan Patton         |47449.500000000000    |
|2537      |Rebbeca Day         |46969.390000000000    |
|2320      |Diane Higgins       |46571.250000000000    |
|2658      |Shepard Anita       |46481.160000000000    |
|2675      |Stoica Rick         |46198.900000000000    |
|2500      |Collene Newton      |45750.670000000000    |
|2479      |Shandra Higgins     |45724.000000000000    |
|2369      |Virgie Mays         |45492.000000000000    |
|2524      |Eve Saunders        |44999.500000000000    |
|2363      |Shameka Spencer     |44518.940000000000    |
|2511      |Jess Nguyen         |44407.690000000000    |
|2661      |Singh Nan           |43955.870000000000    |
|2400      |Elisha Lloyd        |43639.700000000000    |
|2470      |Violeta Stokes      |43560.000000000000    |
|2328      |Arlyne Ingram       |43415.330000000000    |
|2354      |Brock Webb          |43247.320000000000    |
|2471      |Jackeline Finley    |43159.480000000000    |
|2662      |Sloan Constance     |42479.410000000000    |
|2504      |Sherron Simon       |41989.350000000000    |
|2679      |Sutwell Barbara     |41940.600000000000    |
|2421      |Sharell Branch      |41598.960000000000    |
|2447      |Lanora Ray          |41217.000000000000    |
|2627      |Pham Hong           |41183.610000000000    |
|2638      |Rivera Haley        |40799.150000000000    |
|2595      |Maryrose Roberson   |40678.800000000000    |
|2373      |Harriette Melton    |40664.610000000000    |
|2387      |Rayna Tran          |39527.390000000000    |
|2669      |Sparks Taylor       |39151.000000000000    |
|2632      |Purinton Janine     |39149.130000000000    |
|2631      |Punjabhi Louis      |38712.000000000000    |
|2666      |Smith Sade          |37921.710000000000    |
|2372      |Catherina Haney     |37282.960000000000    |
|2641      |Robinson Alain      |37249.000000000000    |
|2621      |Pelletier Ermine    |36999.630000000000    |
|2646      |Roper Katie         |36958.880000000000    |
|2345      |Khalilah Holman     |36519.560000000000    |
|2645      |Roehrich Bianca     |36378.480000000000    |
|2671      |Squatrito Kristen   |35249.250000000000    |
|2468      |Sofia Burnett       |35064.590000000000    |
|2694      |ValentinJackie      |34806.540000000000    |
|2672      |StanfordBarbara  M  |34610.160000000000    |
|2494      |Renea Carney        |34468.200000000000    |
|2629      |Potts Xana          |34166.440000000000    |
|2332      |Jaclyn Atkinson     |33866.000000000000    |
|2434      |Lurline Dennis      |33231.680000000000    |
|2324      |Ka Kaufman          |33186.780000000000    |
|2440      |Lauren Rodriquez    |32939.550000000000    |
|2460      |Jamee Mclaughlin    |32899.300000000000    |
|2424      |Omer Macdonald      |32853.470000000000    |
|2409      |Ocie Walton         |32843.540000000000    |
|2431      |Debra Herring       |32669.550000000000    |
|2348      |Audie Flores        |32588.820000000000    |
|2443      |Alexandra Mcgowan   |32339.230000000000    |
|2311      |Charlie Pacino      |31876.220000000000    |
|2686      |Thibaud Kenneth     |31638.870000000000    |
|2487      |Jermaine Cote       |31559.400000000000    |
|2581      |Florene Craig       |31346.320000000000    |
|2535      |Cristine Bell       |31149.110000000000    |
|2359      |Tennie Gay          |30914.550000000000    |
|2379      |Josh Roach          |30821.000000000000    |
|2514      |Keesha Lambert      |30442.280000000000    |
|2587      |Estela Donovan      |30239.370000000000    |
|2368      |Roxanna Wade        |30183.850000000000    |
|2682      |Tavares Desiree     |30036.450000000000    |
|2582      |Janey Burris        |29806.500000000000    |
|2569      |Elicia Townsend     |29676.580000000000    |
|2474      |Lucinda Hurley      |29153.140000000000    |
|2381      |Meryl Cole          |28929.450000000000    |
|2559      |Marhta Baldwin      |28750.700000000000    |
|2461      |Audrie Cannon       |28544.000000000000    |
|2355      |Melany Mcmahon      |28038.230000000000    |
|2496      |Colette Estrada     |27351.480000000000    |
|2315      |Geraldine Schneider |27224.340000000000    |
|2351      |Jacinta Faulkner    |27066.920000000000    |
|2557      |Blanche Robbins     |26932.660000000000    |
|2589      |Jen Mcmahon         |26485.590000000000    |
|2668      |Soze Keyser         |26453.200000000000    |
|2380      |Luanna Scott        |26249.250000000000    |
|2475      |Gita Logan          |26194.520000000000    |
|2608      |Maple Barnett       |25951.610000000000    |
|2667      |Soto Julia          |25895.930000000000    |
|2352      |Lashon Wall         |25877.620000000000    |
|2491      |Erika Murray        |25791.360000000000    |
|2521      |Jerica Brooks       |25619.650000000000    |
|2374      |Willette Rodgers    |25499.660000000000    |
|2350      |Princess Kane       |25080.000000000000    |
|2628      |Pitt Brad           |24195.540000000000    |
|2313      |Daniel Costner      |23858.450000000000    |
|2510      |Adrienne Lang       |23561.670000000000    |
|2334      |Felicitas Riley     |23533.590000000000    |
|2438      |Gonzalo Stone       |23391.420000000000    |
|2696      |Vega Vincent        |23231.680000000000    |
|2695      |Veera Abdellah      |23040.360000000000    |
|2329      |Willie Barrera      |22570.000000000000    |
|2499      |Jarvis Allison      |22491.750000000000    |
|2455      |Emilio Duncan       |21779.340000000000    |
|2610      |Frank Shannon       |21171.210000000000    |
|2692      |Trzeciak Cybil      |20334.830000000000    |
|2684      |Terry Sharlene      |20330.640000000000    |
|2544      |Shaquita Norman     |20285.300000000000    |
|2335      |Cora Calhoun        |20253.800000000000    |
|2390      |Jaime Lester        |20129.390000000000    |
|2543      |Latoyia Burt        |19839.3800000000000000|
|2327      |Rena Arnold         |19808.6000000000000000|
|2338      |Caitlin Hill        |19799.4000000000000000|
|2619      |Pearson Randall     |19239.6300000000000000|
|2365      |Fransisca Reeves    |18809.1000000000000000|
|2550      |Elroy Wolf          |18605.0000000000000000|
|2483      |Javier Kim          |18564.5300000000000000|
|2700      |John Snow           |18546.8800000000000000|
|2540      |Verla Christian     |17999.5500000000000000|
|2548      |Marianne Bryant     |17661.4500000000000000|
|2538      |Maryrose Cain       |17135.9200000000000000|
|2506      |Stephaine Booker    |16793.8400000000000000|
|2520      |Yolanda Ball        |16754.8200000000000000|
|2673      |Stansfield Norman   |16646.0000000000000000|
|2457      |Emery Schneider     |16155.9300000000000000|
|2333      |Al Schultz          |15996.2800000000000000|
|2388      |Annice Boyer        |15587.5200000000000000|
|2412      |Vanetta Gross       |15299.5500000000000000|
|2533      |Vida Kline          |14849.5500000000000000|
|2622      |Perry Shakira       |14518.7900000000000000|
|2340      |Amira Macdonald     |14431.9800000000000000|
|2549      |Dustin Paul         |14079.5600000000000000|
|2356      |Rogelio Kirby       |14042.0700000000000000|
|2534      |Mayola Houston      |13976.5500000000000000|
|2555      |Don Hansen          |13439.6800000000000000|
|2502      |Retta Martinez      |12764.3800000000000000|
|2376      |Tamatha Delgado     |12724.4000000000000000|
|2633      |Quinn Sean          |12575.4800000000000000|
|2305      |Jeni Levy           |11658.9400000000000000|
|2560      |Peter Gamble        |10935.2000000000000000|
|2690      |Tredinnick Neville  |10592.8800000000000000|
|2685      |Theamstern Sophia   |10534.9000000000000000|
|2423      |Justina Hayes       |10491.6000000000000000|
|2508      |Jaleesa Bowen       |9983.7600000000000000 |
|2603      |Jame Terrell        |9915.6300000000000000 |
|2310      |Charlie Sutherland  |9519.6600000000000000 |
|2564      |Tisha Mcdonald      |9254.9600000000000000 |
|2419      |Olga Wilkins        |9111.6600000000000000 |
|2657      |Sewkumar Nori       |8909.1900000000000000 |
|2553      |Katia Case          |8549.0500000000000000 |
|2433      |Alvaro Hooper       |8371.3800000000000000 |
|2522      |Nichol Carter       |8190.0000000000000000 |
|2397      |Denny Daniel        |8136.3600000000000000 |
|2602      |Ivey Rutledge       |7943.2600000000000000 |
|2509      |Jeannie Poole       |7920.1100000000000000 |
|2308      |Meenakshi Mason     |7588.6200000000000000 |
|2528      |Brandie Buchanan    |7528.9500000000000000 |
|2325      |Sharyl Montoya      |7424.7900000000000000 |
|2422      |Eleanor Farley      |7259.3400000000000000 |
|2323      |Tess Roth           |7086.2400000000000000 |
|2326      |Daniel Glass        |7044.3600000000000000 |
|2590      |Barbie Carter       |6488.8200000000000000 |
|2477      |Lela Ewing          |5982.6400000000000000 |
|2416      |Sharee Carver       |5946.5000000000000000 |
|2484      |Fran Battle         |5759.0400000000000000 |
|2689      |Trang Mei           |5740.0200000000000000 |
|2507      |Emilie Parsons      |5649.8400000000000000 |
|2375      |Calandra Williamson |5164.7700000000000000 |
|2648      |Rossetti Bruno      |5159.7000000000000000 |
|2503      |Annelle Lawrence    |5150.5300000000000000 |
|2647      |Rose Ashley         |4799.2000000000000000 |
|2482      |Carlos Moody        |4784.1500000000000000 |
|2547      |Olivia Conrad       |4619.5800000000000000 |
|2542      |Shenna Blair        |4195.2000000000000000 |
|2437      |Philomena Elliott   |4147.1800000000000000 |
|2459      |Hisako Herrera      |3915.1100000000000000 |
|2364      |Alysa Kane          |3830.4000000000000000 |
|2594      |Josie Steele        |3713.1200000000000000 |
|2417      |Joaquina Mcconnell  |3457.6200000000000000 |
|2406      |Irvin Leach         |3114.6500000000000000 |
|2353      |Corliss Mcneil      |2939.3000000000000000 |
|2561      |Nathan Callahan     |2841.0200000000000000 |
|2623      |Peters Lauren       |2715.3500000000000000 |
|2501      |Vella Hancock       |2351.4400000000000000 |
|2599      |Adam Jacobs         |1889.5500000000000000 |
|2464      |Solange Gates       |1274.2500000000000000 |
|2430      |Tandy Ramsey        |1104.3500000000000000 |
|2636      |Ren Kylo            |730.5700000000000000  |
## Visualization
![Dashboard](https://github.com/ShaikhBorhanUddin/Inventory_Management_Project/blob/main/Images/Sheet%207.png?raw=true)
# Q8: Which product has the highest profit margin, and what is the margin percentage?
## Solution
```SQL
SELECT 
    ProductID, 
    ProductName, 
    ROUND((Profit / ProductStandardCost) * 100, 2) AS ProfitMarginPercentage
FROM Product
ORDER BY ProfitMarginPercentage DESC
LIMIT 1;
```
## Output
|productid|productname                          |profitmarginpercentage|
|---------|-------------------------------------|----------------------|
|P291     |Hynix (H15201504-8) Genuine DDR2 2 GB|66.89                 |

# Q9: Which day of the week has the highest total sales revenue?
## Solution
```SQL
SELECT 
    TO_CHAR(OrderDate, 'Day') AS DayOfWeek, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY DayOfWeek
ORDER BY TotalRevenue DESC
LIMIT 1;
```
## Output
|dayofweek|totalrevenue|
|---------|------------|
|Tuesday  |7816402.08  |

# Q10: Which customers has placed the highest number of orders?
## Solution
```SQL
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalOrders DESC
LIMIT 5;
```
## Output
|customerid|customername      |totalorders|
|----------|------------------|-----------|
|2557      |Blanche Robbins   |1          |
|2498      |Kina Larsen       |1          |
|2436      |Stacia Rutledge   |1          |
|2460      |Jamee Mclaughlin  |1          |
|2554      |Enriqueta Odom    |1          |
|2623      |Peters Lauren     |1          |
|2648      |Rossetti Bruno    |1          |
|2582      |Janey Burris      |1          |
|2468      |Sofia Burnett     |1          |
|2396      |Jon Petersen      |1          |

# Q11: Which employee has been working the longest (oldest hire date)?
## Solution
```SQL
SELECT 
    EmployeeID, 
    EmployeeName, 
    EmployeeHireDate
FROM Employee
ORDER BY EmployeeHireDate ASC
LIMIT 1;
```
## Output
|employeeid|employeename   |employeehiredate|
|----------|---------------|----------------|
|6708      |Volk Colleen   |2000-05-15      |

# Q12: Which product category has generated the highest total revenue?
## Solution
```SQL
SELECT 
    p.CategoryName, 
    SUM(od.OrderItemQuantity * od.PerUnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalRevenue DESC
LIMIT 1;
```
## Output
|categoryname   |totalrevenue|
|---------------|------------|
|Storage        |10712932.17 |
|Video Card     |5746481.52  |
|Mother Board   |5555189.14  |
|CPU            |5366747.48  |
|RAM            |3138740.40  |

# Q13: Which warehouse has the highest total inventory cost (sum of ProductStandardCost for all stored products)?
## Solution
```SQL
SELECT 
    w.WarehouseID, 
    w.WarehouseName, 
    SUM(p.ProductStandardCost) AS TotalInventoryCost
FROM Warehouse w
JOIN Product p ON p.ProductID = p.ProductID
GROUP BY w.WarehouseID, w.WarehouseName
ORDER BY TotalInventoryCost DESC
LIMIT 1;
```
## Output
|warehouseid|warehousename     |totalinventorycost|
|-----------|------------------|------------------|
|101        |Southlake Texas   |725061.81         |

# Q14: Which product has the highest total quantity sold?
## Solution
```SQL
SELECT 
    p.ProductID, 
    p.ProductName, 
    SUM(od.OrderItemQuantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantitySold DESC
LIMIT 1;
```
## Output
|productid|productname           |totalquantitysold|
|---------|----------------------|-----------------|
|P399     |Zotac ZT-P10810A-10P  |157              |

# Q15: List all Canceled orders.
## Solution
```SQL
SELECT 
    p.ProductID, 
    p.ProductName, 
    COUNT(od.OrderDetailsID) AS ReturnCount, 
    od.OrderStatus
FROM OrderDetails od
JOIN Product p ON od.ProductID = p.ProductID
WHERE od.OrderStatus IN ('Canceled')
GROUP BY p.ProductID, p.ProductName, od.OrderStatus
ORDER BY ReturnCount DESC;
```
## Output
|productid|productname                                   |returncount|orderstatus|
|---------|----------------------------------------------|-----------|-----------|
|P286     |Kingston  SV300S37A/120G                      |1          |Canceled   |
|P068     |Intel Xeon E5-2630 V2                         |1          |Canceled   |
|P313     |Transcend (TS512MLK64W6H) DDR3 4GB            |1          |Canceled   |
|P173     |G.Skill Ripjaws V Series                      |1          |Canceled   |
|P349     |Western Digital WD1003FZEX                    |1          |Canceled   |
|P086     |PNY VCQK5200-PB                               |1          |Canceled   |
|P112     |Zotac ZT-P10810D-10P                          |1          |Canceled   |
|P222     |MSI Z170A KRAIT GAMING 3X                     |1          |Canceled   |
|P076     |AMD FirePro W9100                             |1          |Canceled   |
|P229     |Asus VANGUARD B85                             |1          |Canceled   |
|P137     |Corsair Vengeance Pro                         |1          |Canceled   |
|P150     |G.Skill Trident Z                             |1          |Canceled   |
|P081     |HP C2J95AT                                    |1          |Canceled   |
|P335     |Intel Core i7-4960X Extreme Edition           |1          |Canceled   |
|P290     |Corsair Vengeance LPX (CMK8GX4M1A2400C16R) 8GB|1          |Canceled   |
|P353     |Samsung MZ-V6P1T0BW                           |1          |Canceled   |
|P260     |Western Digital WD1003FZEX                    |1          |Canceled   |
|P019     |Intel Xeon E5-2637 V2 (OEM/Tray)              |1          |Canceled   |
|P203     |MSI X299 GAMING M7 ACK                        |1          |Canceled   |
|P171     |G.Skill Trident X                             |1          |Canceled   |
|P251     |Samsung MZ-75E4T0B                            |1          |Canceled   |
|P324     |Intel Xeon E5-2643 V2 (OEM/Tray)              |1          |Canceled   |
|P083     |PNY VCQM5000-PB                               |1          |Canceled   |
|P268     |SanDisk SDSSDHII-240G-G25                     |1          |Canceled   |
|P337     |Intel Xeon E5-1680 V3 (OEM/Tray)              |1          |Canceled   |
|P214     |Asus Z170-WS                                  |1          |Canceled   |
|P161     |Corsair Vengeance LPX                         |1          |Canceled   |
|P326     |Intel Xeon E5-2687W V3                        |1          |Canceled   |
|P247     |Seagate ST3000DM008                           |1          |Canceled   |
|P159     |Corsair Vengeance LPX                         |1          |Canceled   |
|P380     |ASRock EP2C602-4L/D16                         |1          |Canceled   |
|P115     |Gigabyte GV-N98TWF3OC-6GD                     |1          |Canceled   |
|P281     |Crucial CT525MX300SSD4                        |1          |Canceled   |
|P271     |Crucial CT1050MX300SSD1                       |1          |Canceled   |
|P143     |G.Skill Trident Z                             |1          |Canceled   |
|P033     |Intel Xeon E5-2660 V3                         |1          |Canceled   |
|P189     |ASRock E3C224D4M-16RE                         |1          |Canceled   |
|P055     |Intel Xeon E5-2687W                           |1          |Canceled   |
|P343     |Samsung MZ-V6P512BW                           |1          |Canceled   |
|P300     |Kingston (KVR800D2N6K2) 4GB (2 x 2 GB) DDR2   |1          |Canceled   |
|P174     |G.Skill Ripjaws V Series                      |1          |Canceled   |
|P009     |Intel Xeon E5-2695 V2                         |1          |Canceled   |
|P303     |Adata XPG (AX3U1600W4G11-RD) 4GB              |1          |Canceled   |
|P278     |Crucial CT275MX300SSD1                        |1          |Canceled   |
|P235     |Supermicro X10SAT-O                           |1          |Canceled   |
|P358     |PNY SSD7CS1311-120-RB                         |1          |Canceled   |
|P257     |Seagate ST10000DM0004                         |1          |Canceled   |
|P105     |NVIDIA VCQM4000-PB                            |1          |Canceled   |
|P317     |Kingston KVR (KVR16N11/8-SP) 8 GB DDR3        |1          |Canceled   |
|P063     |Intel Core i7-4790K                           |1          |Canceled   |
|P051     |Intel Core i7-6900K (OEM/Tray)                |1          |Canceled   |
|P130     |Corsair Vengeance LPX                         |1          |Canceled   |
|P078     |AMD 100-505989                                |1          |Canceled   |
|P241     |Samsung MZ-75E500B/AM                         |1          |Canceled   |
|P328     |Intel Xeon E5-2667 V3 (OEM/Tray)              |1          |Canceled   |
|P038     |Intel Xeon E5-2650 V4                         |1          |Canceled   |
|P096     |MSI GAMING                                    |1          |Canceled   |
|P015     |Intel Xeon E5-2690 V4                         |1          |Canceled   |
|P007     |Intel Xeon E5-2697 V2                         |1          |Canceled   |
|P362     |Asus SABERTOOTH X99                           |1          |Canceled   |
|P234     |MSI X299 TOMAHAWK ARCTIC                      |1          |Canceled   |
|P146     |Kingston                                      |1          |Canceled   |
|P314     |Hynix 6671G DDR2 1GB                          |1          |Canceled   |
|P244     |SA400S37/120G                                 |1          |Canceled   |
|P374     |EVGA Z270 Classified K                        |1          |Canceled   |
|P232     |MSI Z270 XPOWER GAMING TITANIUM               |1          |Canceled   |
|P199     |Asus Z10PE-D16                                |1          |Canceled   |
|P210     |Asus MAXIMUS VIII EXTREME/ASSEMBLY            |1          |Canceled   |
|P385     |HP C2J95AT                                    |1          |Canceled   |
|P196     |Asus X99-DELUXE/U3.1                          |1          |Canceled   |
|P158     |G.Skill Ripjaws V Series                      |1          |Canceled   |
|P204     |Supermicro MBD-X10DRI-O                       |1          |Canceled   |
|P071     |PNY VCQP6000-PB                               |1          |Canceled   |
|P376     |MSI Z270 XPOWER GAMING TITANIUM               |1          |Canceled   |
|P307     |G.Skill RipjawsX (F3-1600C9Q-32GXM) DDR3 32 GB|1          |Canceled   |
|P140     |Crucial                                       |1          |Canceled   |
|P054     |Intel Core i7-4770K                           |1          |Canceled   |
|P003     |Intel Xeon E5-2698 V3 (OEM/Tray)              |1          |Canceled   |
|P369     |Asus MAXIMUS IX CODE                          |1          |Canceled   |
|P265     |Samsung MZ-7KE256BW                           |1          |Canceled   |
|P394     |PNY VCQK4200-PB                               |1          |Canceled   |
|P186     |Asus Rampage V Edition 10                     |1          |Canceled   |
|P156     |G.Skill Trident Z                             |1          |Canceled   |
|P388     |ATI FirePro S9050                             |1          |Canceled   |
|P169     |Corsair Dominator Platinum                    |1          |Canceled   |
|P365     |ASRock EP2C602-4L/D16                         |1          |Canceled   |
|P206     |Asus X99-DELUXE II                            |1          |Canceled   |
|P052     |AMD Opteron 6378                              |1          |Canceled   |
|P044     |Intel Core 2 Extreme QX6800                   |1          |Canceled   |
|P400     |MSI GAMING                                    |1          |Canceled   |
|P375     |EVGA Classified                               |1          |Canceled   |
|P124     |G.Skill Trident Z                             |1          |Canceled   |
|P295     |Samsung (M378T5263AZ3) 2GB DDR2               |1          |Canceled   |
|P183     |Asus Z10PE-D8 WS                              |1          |Canceled   |
|P339     |Intel Core i7-6950X (OEM/Tray)                |1          |Canceled   |
|P272     |Western Digital WDS250G1B0B                   |1          |Canceled   |
|P192     |Supermicro X9SRH-7TF                          |1          |Canceled   |
|P309     |Kingston HyperX FURY (HX318C10F/8) DDR3 8GB   |1          |Canceled   |
|P276     |Western Digital WD2500AVVS                    |1          |Canceled   |
|P398     |MSI GTX 1080 TI LIGHTNING X                   |1          |Canceled   |
|P153     |Corsair Dominator Platinum                    |1          |Canceled   |
|P391     |AMD FirePro S7000                             |1          |Canceled   |
|P175     |Kingston                                      |1          |Canceled   |
|P255     |Hitachi HUS724030ALE641                       |1          |Canceled   |
|P322     |Intel Xeon E5-2695 V4                         |1          |Canceled   |
|P240     |Samsung MZ-75E250B/AM                         |1          |Canceled   |
|P289     |HP (500203-061) 4GB DDR3                      |1          |Canceled   |
|P061     |Intel Xeon E5-2630 V3                         |1          |Canceled   |
|P026     |Intel Xeon E5-2670 V3                         |1          |Canceled   |
|P332     |Intel Xeon E5-2683 V4                         |1          |Canceled   |
|P101     |EVGA 11G-P4-6598-KR                           |1          |Canceled   |
