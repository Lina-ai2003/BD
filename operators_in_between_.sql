/*операторы in, between, like, is null и агрегатные функции*/
/*IN - выборка из множества значений*/

SELECT 
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    `customers`.`city` IN ('новосибирск' , 'омск');
    
    
SELECT 
    `sales`.`sdate`, `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    `sales`.`sdate` IN ('2024-09-12' , '2024-09-13', '2024-12-23');
    
    /*BETWEEN - выборка из диапазона значений*/
SELECT 
    `sales`.`sdate`, `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    `sales`.`sdate` BETWEEN '2024-09-12' AND '2024-12-23';
    
    
SELECT 
    `salespeaple`.`snum`,
    `salespeaple`.`sname`,
    `salespeaple`.`city`,
    `salespeaple`.`comm`
FROM
    `shop`.`salespeaple`
WHERE
    `salespeaple`.`comm` BETWEEN 0.09 AND 0.11;
    /*исключения границ диапазона при помощи комбинации between и in*/
    SELECT 
    `salespeaple`.`sname`,
    `salespeaple`.`city`,
    `salespeaple`.`comm`
FROM
    `shop`.`salespeaple`
WHERE
    `salespeaple`.`comm` BETWEEN 0.09 AND 0.11
        AND NOT `salespeaple`.`comm` IN (0.09 , 0.11);
	        
	        SELECT 
		    `customers`.`cname`,
		    `customers`.`city`,
		    `customers`.`rating`,
		    `customers`.`snum`
		FROM
		    `shop`.`customers`
		WHERE
		    `customers`.`city` BETWEEN 'н' AND 'о'
		ORDER BY `customers`.`city`;

		/*оператор like*/        
/* '%'- любое количество любых символов, '_'-один любой символ*/

SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    city LIKE 'н%';
    
    SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    city LIKE 'нов_%';
    
       SELECT 
    `customers`.`cnum`,
    `customers`.`cname`,
    `customers`.`city`,
    `customers`.`rating`,
    `customers`.`snum`
FROM
    `shop`.`customers`
WHERE
    cname LIKE '%и%/%' escape '/';



ELECT 
    sum(*)
FROM
    sales
    
    /*подсет количества строк за определенный период*/
SELECT 
    COUNT(*)
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate <= '2024-09-30';
	       
	       /*среднее значение за период*/
SELECT 
    AVG(amount)
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate <= '2024-09-30';
	   
	   /*среднее*/
  SELECT 
    AVG(sdate)
FROM
    sales
WHERE
    sdate > '2024-09-01'
        AND sdate <= '2024-09-30';

	/*при использовании distinct внутри функции COUNT()
подсчитываются только уникальные значения в столбце */
SELECT 
    COUNT(distinct city)
FROM
    customers;
    
    /* null- значения игнорируются при подсчете значений по одному столбцу*/
SELECT 
    COUNT(rating)
FROM
    customers;
  
  /*фяункция max и min работают со строковыми значениями, 
  ориентируются на алфаитный порядок*/
SELECT 
    Min(cname)
FROM
    customers;
    
    /*группировка максимальных значений продаж по каждому продавцу*/
SELECT 
    snum, MAX(amount)
FROM
    sales
GROUP BY snum;
    
        /*группировка значений по нескольким столбцам*/
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate;
    
/*отбор значений после группировки
 осуществляетсяс помощью специального выраения having.
 where отбирает строки до группировки и не может содержать агрегатные функции*/
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate
HAVING MAX(amount)>1000;
    
    
    /*HAVING  можно использовать только для сгруппированных столбцов */
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
GROUP BY snum , sdate
HAVING sdate > '2024-09-15';    
    
   /*если в группировке не используется поле,
   по которому нужно сделать отбор то исппользуется только выражение where */
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
WHERE
    sdate > '2024-09-15'
GROUP BY snum , sdate;  

/*использование in с having*/  
SELECT 
    snum, sdate, MAX(amount)
FROM
    sales
WHERE
    sdate > '2024-09-15'
GROUP BY snum
HAVING snum IN (101 , 106); 
