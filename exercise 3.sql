
--1.Qeyd olunan excel-dən istifadə edərək cədvəl yaradın və dataları insert all vasitəsilə edin 
create table nobel_win (year varchar2 (20),
                        subject varchar2 (20),
                        winner varchar2 (30),
                        country varchar2 (20),
                        category varchar2 (20));
  
  drop table nobel_win;
                        
insert all
into nobel_win ( year,subject,winner,country,category)
values('1970','Physics','Hannes Alfven','Sweden','Scientist')
into nobel_win ( year,subject,winner,country,category)
values('1970','Physics','Louis Neel','France','Scientist')
into nobel_win ( year,subject,winner,country,category)
values('1970','Chemistry','Luis Federico Leoir','France','Scientist')
into nobel_win ( year,subject,winner,country,category)
values('1970','Physiology','Julius Axelrod','USA','Scientist')
into nobel_win ( year,subject,winner,country,category)  
values('1970','Physiology','Ulf von Euler','Sweden','Scientist')
into nobel_win ( year,subject,winner,country,category) 
values('1970','Physiology','Bernard Katz','Germany','Scientist')
into nobel_win ( year,subject,winner,country,category) 
values('1970','Literature','Alexandr Solzhenitsyn','Russia','Linguist')
into nobel_win ( year,subject,winner,country,category) 
values('1970','Economics','Paul Samuelson','USA','Economist')
into nobel_win ( year,subject,winner,country,category) 
values('1971','Physics','Dennis Gabor','Hungary','Scientist')  
into nobel_win ( year,subject,winner,country,category) 
values('1971','Chemistry','Gerhard Herzberg','Germany','Scientist') 
into nobel_win ( year,subject,winner,country,category) 
values('1971','Peace','Willy Brandt','Germany','Chancellor')
into nobel_win ( year,subject,winner,country,category) 
values('1971','Literature','Pablo Neruda','Chile','Linguist')
into nobel_win ( year,subject,winner,country,category) 
values('1971','Economics','Simon Kuznets','Russia','Economist')
into nobel_win ( year,subject,winner,country,category) 
values('1978','Peace','Anwar al-Sadat','Egypt','President')
into nobel_win ( year,subject,winner,country,category) 
values('1978','Peace','Menachem Begin','Israel','Prime Minister')
into nobel_win ( year,subject,winner,country,category) 
values('1994','Peace','Yitzhak Rabin','Israel','Prime Minister')
into nobel_win ( year,subject,winner,country,category) 
values('1987','Physics','Johannes Georg Bednorz','Germany','Scientist')
into nobel_win ( year,subject,winner,country,category) 
values('1987','Chemistry','Donald J. Cram','USA','Scientist')
into nobel_win ( year,subject,winner,country,category) 
values('1987','Chemistry','Jean-Marie Lehn','France','Scientist')
into nobel_win ( year,subject,winner,country,category) 
values('1987','Physiology','Susumu Tonegava','Japan','Scientist')
into nobel_win ( year,subject,winner,country,category) 
values('1987','Literature','Joseph Brodsky','Russia','Linguist')
into nobel_win ( year,subject,winner,country,category) 
values('1987','Economics','Robert Solow','USA','Economist')
into nobel_win ( year,subject,winner,country,category) 
values('1994','Literature','Kenzaburo Oe','Japan','Linguist')
into nobel_win ( year,subject,winner,country,category) 
values('1994','Economics','Reinhard Selten','Germany','Economist')
Select * from dual;

select * from nobel_win;

--2.Year sütunun adını date ilə əvəz edin
alter table nobel_win rename column year to "date";

--3.1970-ci ildən fərqli illərdə nobel alanların siyahısını çıxarın.
--Nobel alma tarixini həmin ilin yanvarın 1-i kimi ekrana çıxarın. Məsələn 1994-cü ildirsə ekrana 01.01.1994 çıxsın
select * from nobel_win e where e."date" not in '1970';



--4.Adı ‘Louis’-lə başlayanların year, subject, winner, country sütunlarını çıxarın

select "date",subject,winner,country from nobel_win e where e.winner like 'Louis%'; 


--5.Həmin cədvəlin dublikatını yaradın içinə data insert etmədən.
--Və cədvəlin adı archive olsun. Cədvəldə əlavə olaraq archive_date sütunu yaradın

create table "archive" as select * from nobel_win  where 5=3;
select*from "archive";
alter table "archive" add archive_date varchar2 (20);

--6.Bu cədvələ dataları sheet-2dən istifadə edərək və insert all vasitəsilə edin.
insert all
into "archive"("date",subject,winner,country,category)
values('1970','Physics','Louis Neel','France','Scientist')
into "archive"("date",subject,winner,country,category)
values('1970','Chemistry','Luis Federico Leloir','France','Scientist')
into "archive"("date",subject,winner,country,category)
values('1970','Physiology','Julius Axelrod','USA','Scientist')
into "archive"("date",subject,winner,country,category)
values('1970','Physiology','Ulf von Euler','Sweden','Scientist')
into "archive"("date",subject,winner,country,category)
values('1970','Physiology','Bernard Katz','German','Scientist')
into "archive"("date",subject,winner,country,category)
values('1970','Literature','Alexandr Solzhenitsyn','Russia','Linguist')
into "archive"("date",subject,winner,country,category)
values('1970','Economics','Paul Samuelson','USA','Economist')
select *from dual;
select*from "archive";


--7.Archive cədvəlinəki   archive_date sütununa sysdate default dəyərini təyin edin
alter table "archive" modify archive_date default sysdate;



--8.Tranzaksiyaya savepoint qoyun. Adı A olsun
savepoint A;


--9. Əsas cədvəldən adında ‘–‘ olan qaliblərin siyahısını silin və silməmişdən əvvəl bu dataları archive cədvəlinə insert edin. 
--Sonra yenə savepoint qoyun və adı  B olsun




--10.Əsas cədvəldə kategoriya  Linguist olanların country-sini USA ilə əvəz edin.
update nobel_win e set e.country='USA' where e.category='Linguist'; 

select*from nobel_win;

--11.Tranzaksiyani A savepointinə rollback edin

rollback;


--12.Commit edin və bazada nə baş verdi comment şəklində yazın.

commit;
--10cu tapsirigin icrasi arxaya qayitdi



--13.Archive cədvəlindəki dataları əsas cədvəllə eyniləşdirin.

merge into nobel_win
using "archive"
on(nobel_win.winner="archive".winner)
when matched then
update set nobel_win.subject = "archive".subject
when not matched then







