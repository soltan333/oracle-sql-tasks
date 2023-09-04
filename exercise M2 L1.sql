--1) Belə 3 sütundan ibarət bir table yaradin
create table ish_gunleri (year number,
                                month number,
                                holiday_list varchar2 (50));
                                
insert all
into ish_gunleri(year,month,holiday_list)
values(2019,1,'WHWWHHWWWWWHHWWWWWHHWWWWWHHWWWW')
into ish_gunleri(year,month,holiday_list)
values(2019,2,'WHHWWWWWHHWWWWWHHWWWWWHHWWWW')
into ish_gunleri(year,month,holiday_list)
values(2019,3,'WHHWWWWHHHWWWWWHHWWHHHHHHHWWWHH')
into ish_gunleri(year,month,holiday_list)
values(2019,4,'WWWWWHHWWWWWHHWWWWWHHWWWWWHHWW')
into ish_gunleri(year,month,holiday_list)
values(2019,5,'WWWHHWWWHWHHWWWWWHHWWWWWHHWHWWW')
into ish_gunleri(year,month,holiday_list)
values(2019,6,'HHWWWWWHHWWWWWHHHWWWWHHWWHWWHH')
into ish_gunleri(year,month,holiday_list)
values(2019,7,'WWWWWHHWWWWWHHWWWWWHHWWWWWHHWWW')
into ish_gunleri(year,month,holiday_list)
values(2019,8,'WWHHWWWWWHHWWWWWHHWWWWWHHWWWWWH')
into ish_gunleri(year,month,holiday_list)
values(2019,9,'HWWWWWHHWWWWWHHWWWWWHHWWWWWHHW')
into ish_gunleri(year,month,holiday_list)
values(2019,10,'WWWWHHWWWWWHHWWWWWHHWWWWWHHWWWW')
into ish_gunleri(year,month,holiday_list)
values(2019,11,'WHHWWWWWHHWWWWWHHWWWWWHHWWWWWH')
into ish_gunleri(year,month,holiday_list)
values(2019,12,'HWWWWWHHWWWWWHHWWWWWHHWWWWWHHWH')
select * from dual;

select * from ish_gunleri;

--2) Holiday list sutununda ay id-lər 1,3,5,7,9 oldugu halda
-- Holiday List sütunundakı ilk H hərfinin indeksini tapin

select instr(holiday_list,'H',1,1) from ish_gunleri where month in (1,3,5,7,9);

--3) Holiday list sütununda month 3 və 8 aralığında olanların iş günlərinin sayını tapmaq
select length(holiday_list)-length(replace (holiday_list,'H',''))
from ish_gunleri where month between 3 and 8;

--4) 5 gün ardıcıl ev günü olan ayları tapmaq
select * from ish_gunleri where instr(holiday_list,'HHHHH')>0;

--5) Hər ayın sonuncu iş günü tarixini ekrana çıxarmaq


--6) W-ləri iş günü H-ları qeyri-iş günü olaraq əvəzləyib ekrana çıxarın
select translate(holiday_list,'HW','WH')  from ish_gunleri;

--7) Hər aydakı iş günləri və qeyri-iş günlərinin sayını ekrana çıxarın
select length(holiday_list)-length(replace (holiday_list,'H','')),
length(holiday_list)-length(replace (holiday_list,'W','')) from ish_gunleri;

--8) Hər ay üzrə sonuncu qeyri-iş günü tarixi ilə həmin ayın sonuncu günü arasında
--neçə gün fərq var hesablayın




--9) Bazar ertəsi günü iş günü olmayan ayları ekrana çıxarın
select * from ish_gunleri where instr(holiday_list,'HHH')>0;


--10) İş günü qeyri-iş günlərindən 10 gün-dən artıq çox olan ayları çıxarın
select * from ish_gunleri where 
length(holiday_list)-length(replace (holiday_list,'W',''))-
(length(holiday_list)-length(replace (holiday_list,'H','')))>10;



























