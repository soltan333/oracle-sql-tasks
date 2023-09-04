
select * from salesman1;
select * from customer1;
select * from orders;

--1.Aşağıdakı cədvəllərdən London şəhərində yerləşən bütün satış işçiləri və müştəriləri
-- tapmaq üçün SQL sorğusu yazın.
select s.salesman_id, s.name,'salesman' from salesman1 s where s.city='London'
union all
select c.customer_id,c.cust_name,'customer' from customer1 c where c.city='London'; 

--2. Aşağıdakı cədvəllərdən fərqli satıcıları və onların şəhərlərini tapmaq üçün
-- SQL sorğusu yazın. Satıcı şəxsiyyət vəsiqəsi və şəhəri qaytarın.
select s.salesman_id,s.city from salesman1 s
union 
select c.salesman_id,c.city from customer1 c;

--3. Aşağıdakı cədvəllərdən inventar idarəetmə sistemində iştirak edən bütün satıcıları 
--və müştəriləri tapmaq üçün SQL sorğusu yazın. Satıcı şəxsiyyətini, müştəri ID-sini
-- qaytarın.
select c.customer_id,c.salesman_id from customer1 c
union
select o.customer_id,o.salesman_id from orders o;

--4. Aşağıdakı cədvəldən hər tarixdə ən böyük və ən kiçik sifarişləri yaradan satıcıları
--tapmaq üçün SQL sorğusu yazın. Satıcı şəxsiyyətini, adı, sifariş nömrəsi,
--ən yüksək/ən aşağı, sifariş tarixini qaytarın.
select s.salesman_id,s.name,o.ord_no,o.ord_date,'max' from salesman1 s 
   inner join orders o on s.salesman_id=o.salesman_id where o.purch_amt in    
                                                 (select max(o1.purch_amt) from orders o1 group by o1.ord_date )
union   

select s1.salesman_id,s1.name,o2.ord_no,o2.ord_date,'min' from salesman1 s1
   inner join orders o2 on s1.salesman_id=o2.salesman_id where o2.purch_amt in
                                                     (select min(o3.purch_amt) from orders o3 group by o3.ord_date );
   
--5. Aşağıdakı cədvəllərdən hər tarixdə ən böyük və ən kiçik sifarişləri yaradan satıcıları
--tapmaq üçün SQL sorğusu yazın. Üçüncü sahədə nəticə dəstini çeşidləyin.
-- Satıcı şəxsiyyətini, adı, sifariş nömrəsi, ən yüksək/ən aşağı, sifariş tarixini qaytarın.
select s.salesman_id,s.name,o.ord_no,o.ord_date,'max' from salesman1 s 
   inner join orders o on s.salesman_id=o.salesman_id where o.purch_amt in    
                                                 (select max(o1.purch_amt) from orders o1 group by o1.ord_date )
union   

select s1.salesman_id,s1.name,o2.ord_no,o2.ord_date,'min' from salesman1 s1
   inner join orders o2 on s1.salesman_id=o2.salesman_id where o2.purch_amt in
                                                     (select min(o3.purch_amt) from orders o3 group by o3.ord_date )
                                                     
order by 3;

--6. Aşağıdakı cədvəllərdən SQL sorğusu yazın ki, müştərinin yaşadığı eyni şəhərdə yaşayan,
--eləcə də şəhərlərində müştərisi olmayan satıcıları 'UYĞUN YOX' işarəsi ilə tapın.
--2-ci sütunda (yəni ad) nəticə dəstini azalan qaydada çeşidləyin.
--Satıcı şəxsiyyətini, adını, müştərinin adını, komissiyasını qaytarın. --------------
select s.salesman_id,s.name,s.commission from salesman1 s 
                                      where s.city in (select c.city from customer1 c)
union           
select s1.salesman_id,s1.name,s1.commission from salesman1 s1 
                                     where s1.city not in (select c1.city from customer1 c1)
order by 2 desc;                                     


--7. Aşağıdakı cədvəllərdən hər hansı satıcının şəhərinin hər hansı müştərinin şəhəri ilə
-- uyğun olub-olmadığını göstərən seçilmiş sahələrə sətirlər əlavə edən SQL sorğusu yazın.
-- Satıcı şəxsiyyətini, adı, şəhəri, UYĞUN/UYĞUNLUĞU YOXDUR
select s.salesman_id,s.name,s.commission,'Matched' from salesman1 s 
                                      where s.city in (select c.city from customer1 c)
union           
select s1.salesman_id,s1.name,s1.commission,'Not matched' from salesman1 s1 
                                     where s1.city not in (select c1.city from customer1 c1)
order by 2 desc;     


--8. Aşağıdakı cədvəldən müştəri identifikatorunu, şəhərləri və bütün müştərilərin 
--reytinqlərini göstərən iki sorğunun birliyini yaratmaq üçün SQL sorğusu yazın.
-- 300 və ya daha yüksək reytinqə malik olanlar "Yüksək Reytinq", digərlərində isə
-- "Aşağı Reytinq" sözləri olacaq.

select c.customer_id,c.city,c.grade,'High Rating' from customer1 c where grade>=300
union
select c1.customer_id,c1.city,c1.grade,'Low Rating' from customer1 c1 where grade<=300;


--9. Aşağıdakı cədvəldən birdən çox sifariş vermiş satıcıları və müştəriləri tapmaq üçün
-- SQL sorğusu yazın. ID-ni, adı qaytarın.

select s.salesman_id,s.name,'salesman' from salesman1 s where 
(select count(*) from orders o where o.salesman_id=s.salesman_id)>1
union
select c.salesman_id,c.cust_name,'customer' from customer1 c where 
(select count(*) from orders o1 where o1.customer_id=c.customer_id)>1


