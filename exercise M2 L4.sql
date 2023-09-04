-- Titanic adli excel faylindaki datani sql e import etmeli
--1)adlar sutununda vergule qeder hisseni first name aliasi ile,vergulden sonraki hisseni
-- second name aliasi ile cekmek
select * from titanic;

select substr(name,1,instr(name,',')-1)  first_name,
substr(name,instr(name,',')+1) second_name from titanic;

--2)Gemide olenlerin sayini cixartmaq
--(Survived sutununda 0 olenleri bildirir)
select count(survived) from titanic where survived=0;

--3)sag qalanlardan necesinin qadin oldugunu teyin etmek
select count(survived) from titanic where survived=1 and sex='female';

--4)yasi 13 den az usaqlarin adini ve yasini hemcinin bilet nomresini ekrana cixartmaq
select substr(name,1,instr(name,',')-1)  first_name,age,ticket from titanic;

--5)olenler arasindan eger yasi 15 den kicikdirse  'usaq'
--eger 15-45 arasindadirsa genc
--eger 45 den coxdursa yasli sozunu ekrana cixartmaq alias olaraq kriterya adini vermek.
--Selectde kriteryadan basqa yas,ad sutunlari da ekrana cixmali
select case when age<15 then 'usaq'
when age>15 and age<45 then 'genc'
when age>45 then 'yasli' end result,age,name from titanic;

--5) PassengerID si en kicik olanin melumatlarini ekrana cixartmaq
select * from titanic order by passengerld fetch next 1 rows only;

--6)Fare sutunu biletin qiymetini bildirir.En bahalai bileti olan ilk 3 musterini ekrana
-- cixartmaq ve neticeni coxdan aza silamaq  order by reqemlerden istifade etmekle
select * from titanic order by fare desc fetch next 3 rows only;

--7)sag qalanlar arasindan en yasli qadinin  adini ve yasini ekrana cixartmaq
select substr(name,1,instr(name,',')-1) first_name,age from titanic where sex='female'
 order by age desc nulls last fetch next 1 rows only ;



--8)sag qalanlr arasindan en cavan kisisnin yasini mueyyenlesdirmek
select min (age) from titanic where sex='male';

--9)en ucuz bileti olan ilk 5  sernisinin adini cinsini ve biletinin nomresini ekrana
-- cixartmaq
select substr(name,1,instr(name,',')-1) first_name,sex,ticket from titanic
order by fare fetch next 5 rows only;

--10)Sernisin adini ,biletin qiymetini ve biletin qiymeti 100 den kicikdirse qabagina P ,
--100 den boyukdurse qabagina R cixartmaq
select name,fare,case when fare<100 then 'P'
when fare>100 then 'R' end result from titanic;



