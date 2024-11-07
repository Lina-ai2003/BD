ELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`comm` * 100 AS 'комм. в %'
FROM
    shop.salespeaple; 
    
    /*добавление текста в результат запроса*/
   SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`comm` * 100 AS 'комм. в %', '%'
FROM
    shop.salespeaple;  
    
 /*форматирование отчета средствами SQL*/   
SELECT
'на дату ' , sdate as 'дата', 'сделано ', count(*) as 'количество', 'заказов'
FROM
    shop.sales
    group by sdate;  
  
  
  /*выражение interval для вычисления дат*/
 SELECT 
    sdate
FROM
    sales
WHERE
    sdate < '2024-09-01' + INTERVAL 14 DAY
        AND sdate > '2024-09-01' - INTERVAL 14 DAY; 
	    
	    /*использование выражение interval для указания количества месяцев*/
 SELECT 
    sdate
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate < '2024-09-01' + INTERVAL 1 MONTH;   
	    
	/*сортировка значений*/
SELECT 
    *
FROM
    sales
ORDER BY sdate, amount ;
    
    /*сортировка по двум столбцам */
SELECT 
    *
FROM
    sales
ORDER BY sdate, amount ;
    
    /*сортировка стобцов с указанием их номера*/
 SELECT 
    *
FROM
    sales
ORDER BY 3 desc, 4 ;   
    
/*сортировка по агрегатным группам*/    
   SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate
ORDER BY snum, sdate;
    
    
    /*сортировка по значению, подсчитаному агрегатной функцией*/
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate
ORDER BY snum, 3; 
    
    /*null - значения и сортировка ORDER BY
    MySQL выводит NULL-значения впереди остальных при сортировке по возрастанию*/
SELECT 
    *
FROM
    shop.customers
ORDER BY rating;   
