/* использование языка sql для выборки информации из таблиц */

/* простая выборка из таблицы */ 
SELECT 
    `sales`.`cnum`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM `shop`.`sales`;

/* отбор без повторяющихся значений */
SELECT distinct 
    `sales`.`sdate`, `sales`.`snum`
FROM `shop`.`sales`;

/* отбор по условиям (предложение where)*/
/* отбор продавцов из определенных городов*/
SELECT 
	`salespeaple`.`sname`, 
	    `salespeaple`.`comm`
	FROM
	    `shop`.`salespeaple`
	WHERE
	    `salespeaple`.`city` = 'новосибирск'
	        OR `salespeaple`.`city` = 'омск';
		        
		/*отбор покупателей по рейтингу*/
SELECT 
	`customers`. `cname`,
	    `customers`.`city`
	FROM
	    `shop`.`customers`
	WHERE
	   `customers`.`rating`>=200;
	   
	   SELECT 
		`customers`. `cname`,
		    `customers`.`city`
		FROM
		    `shop`.`customers`
		WHERE
		   `customers`.`rating`<>200;
		   
		   SELECT 
			`customers`. `cname`,
			    `customers`.`city`
			FROM
			    `shop`.`customers`
			WHERE
			  NOT `customers`.`rating`=200;
			  
			  /*применение условий отбора для null-значений*/
  SELECT 
	`customers`. `cname`,
	    `customers`.`city`
	FROM
	    `shop`.`customers`
	WHERE
	   `customers`.`rating`<> 200 OR `customers`.`rating`= 200;
	   /*NULL-значения (неизвестный результат сравнения) не выводятся в результат отбора*/
   
   
   /*составные условия с логическими операторами OR, AND, NOT*/
SELECT 
	`customers`. `cname`,
	    `customers`.`city`
	FROM
	    `shop`.`customers`
	WHERE
	   `customers`.`city`='омск' AND NOT `customers`.`rating`> 200;
	   
	SELECT 
		`customers`. `cname`,
		    `customers`.`city`
		FROM
		    `shop`.`customers`
		WHERE
		  NOT `customers`.`city`='омск' AND NOT `customers`.`rating`> 200;
		  
		  SELECT 
			`customers`. `cname`,
			    `customers`.`city`
			FROM
			    `shop`.`customers`
			WHERE
			   NOT (`customers`.`city`='омск' AND `customers`.`rating`> 200);
			   
			   /*пример отбора по датам*/
  SELECT 
    `sales`.`snum`,
    `sales`.`cnum`,
    `sales`.`sdate`,
    `sales`.`amount`
FROM
    `shop`.`sales`
WHERE
    (`sales`.`sdate` > '2024-08-05'
	        AND `sales`.`sdate` < '2024-10-01')
	        AND (NOT (`sales`.`sdate` > '2024-09-12'
				        AND `sales`.`sdate` < '2024-09-15'))
			        AND NOT cnum = 204;
				        
				SELECT 
				    `sales`.`snum`,
				    `sales`.`cnum`,
				    `sales`.`sdate`,
				    `sales`.`amount`
				FROM
				    `shop`.`sales`
				WHERE
				    (`sales`.`sdate` > '2024-08-05'
					        AND `sales`.`sdate` < '2024-10-01')
					        AND (NOT (`sales`.`sdate` > '2024-09-12'
								        AND `sales`.`sdate` < '2024-09-15'))
							        AND NOT cnum = 204 OR (cnum=204) and (`sales`.`sdate` > '2024-09-30'
									        AND `sales`.`sdate` <= '2024-10-31');

									   
