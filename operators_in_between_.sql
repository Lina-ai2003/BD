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




