select * from salesman1;
select * from customer1;
select * from orders;



--1. Aşağıdakı cədvəllərdən 'Paul Adam' satıcısı tərəfindən verilən bütün sifarişləri tapmaq
--üçün SQL sorğusu yazın. ord_no, purch_amt, ord_date, customer_id və salesman_id-i qaytarın.s
select o. from orders o where o.salesman_id  in
(select s.salesman_id from salesman1 s where s.name='Paul Adam');

--2. Aşağıdakı cədvəllərdən Londonda fəaliyyət göstərən satıcılar tərəfindən yaradılan bütün
--sifarişləri tapmaq üçün SQL sorğusu yazın.
-- ord_no, purch_amt, ord_date, customer_id, salesman_id-i qaytarın.
select * from orders o where o.salesman_id in
(select s.salesman_id from salesman1 s where s.city='London');

--3. İD-si 3007 olan müştərilər üçün işləyə bilən satış işçiləri tərəfindən yaradılan bütün
--sifarişləri tapmaq üçün aşağıdakı cədvəllərdən SQL sorğusu yazın.
--Ord_no, purch_amt, ord_date, customer_id, salesman_id qaytarın.
select * from orders o where o.salesman_id in
(select o1.salesman_id from orders o1 where o1.customer_id=3007);

--4. Aşağıdakı cədvəllərdən 10 Oktyabr 2012-ci il tarixli orta sifariş qiymətindən böyük 
--sifariş dəyərlərini tapmaq üçün SQL sorğusu yazın.
-- Ord_no, purch_amt, ord_date, customer_id, salesman_id qaytarın.
select * from orders o where o.purch_amt>
(select avg(o1.purch_amt) from orders o1 where to_date('10.10.2012','dd.mm.yyyy')=o1.ord_date)

--5. Aşağıdakı cədvəllərdən Nyu York şəhərində yaradılan bütün sifarişləri tapmaq üçün 
--SQL sorğusu yazın. ord_no, purch_amt, ord_date, customer_id və salesman_id-i qaytarın.
select * from orders o where o.salesman_id in 
(select s.salesman_id from salesman1 s where s.city='New York');

--6. Parisdəki satış işçilərinin komissiyasını müəyyən etmək üçün aşağıdakı cədvəllərdən 
--SQL sorğusu yazın. Qaytarma komissiyası.
select s.commission from salesman1 s where s.salesman_id in
(select c.salesman_id from customer1 c where c.city='Paris');


--7.ID-si Mc Lyon-un satıcı ID-sindən aşağıda 2001 olan bütün müştəriləri göstərmək üçün 
--sorğu yazın.
select * from customer1 c where c.salesman_id=
(select s.salesman_id from salesman1 s where s.name='Mc Lyon');


--8. Aşağıdakı cədvəllərdən Nyu-York şəhərində orta qiymətdən yuxarı olan müştərilərin 
--sayını hesablamaq üçün SQL sorğusu yazın. Qiyməti qaytarın və sayın.
select grade,count(c.customer_id) from customer1 c 
where c.grade> (select avg(c1.grade) from customer1 c1 where c1.city='New York') 
group by grade;

--9. Aşağıdakı cədvəllərdən maksimum komissiya qazanan satıcıları tapmaq üçün SQL sorğusu 
--yazın. ord_no, purch_amt, ord_date və salesman_id-i qaytarın.
select * from orders o where o.salesman_id in
(select s.salesman_id from salesman1 s where s.commission=
   (select max(s1.commission)  from salesman1 s1));
   
--10. 17 avqust 2012-ci il tarixində sifariş verən müştəriləri tapmaq üçün aşağıdakı 
--cədvəllərdən SQL sorğusu yazın. ord_no, purch_amt, ord_date, customer_id, salesman_id və
--cust_name qaytarın
