/*подзапросы */
/*простейшая форма подзапроса - сравнении нужного значения с результатом выполнения поздапроса
подзапрос должен вызвращасть единственное значение*/
SELECT 
    *
FROM
    sales
WHERE
    snum = (SELECT 
            snum
        FROM
            salespeaple
        WHERE
            sname = 'маша');
         
         
         /*если подзапрос может верноть несколько значений, 
         то возамоно использование оператора in во внешнем запросе*/
      SELECT 
    *
FROM
    sales
WHERE
    snum in (SELECT 
            snum
        FROM
            salespeaple
        WHERE
            sname = 'маша');      
            
            
            SELECT 
    *
FROM
    sales
WHERE
    snum IN (SELECT 
            snum
        FROM
            salespeaple
        WHERE
            city = 'тверь');
            
          /*cсписок продаж покупателю с нимером 201*/  
            
            SELECT 
    amount, sdate, salespeaple.snum, salespeaple.sname                                                                                                                            
FROM
    sales natural join salespeaple
WHERE
    snum IN (SELECT 
            snum
        FROM
            sales
        WHERE
            cnum = 201);
            
           /*коммисионные продавцов, обслуживающих покупателей из томска*/
           
           SELECT 
    comm
FROM
    salespeaple
WHERE
    snum IN (SELECT 
            snum
        FROM
            customers
        WHERE
            city = 'томск');
            
     /* использвание агрегатрых функций в подзапросах*/       
      SELECT 
    *
FROM
    sales
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            sales
        WHERE
            sdate = '2024-09-12');
          
          
          /*пример исппользования выражений в подзапросе*/
	SELECT 
    *
FROM
    sales
WHERE
    amount > (SELECT 
          500 + AVG(amount)
        FROM
            sales
        WHERE
            sdate = '2024-09-12' and sdate < '2024-09-12' + interval 15 day);
        
       /*подзапросы в пердложени having */ 
       /*нахоим сколько групп покупателей имеют рейтинги больше чем средний рейтинг по новосибу*/
            SELECT 
    rating, COUNT(DISTINCT cnum)
FROM
    customers
GROUP BY rating
HAVING rating > (SELECT 
        AVG(rating)
    FROM
        customers
    WHERE
        city = 'новосибирск');
            

