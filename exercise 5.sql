insert into jobs values(4800,
                        'Coordinator',
                        2300,
                        3000);

insert into regions values(952648,
                           'Western Europe');
                           
insert into countries values(86855,
                             'France',
                             952648);
                             
insert into locations values(49545,
                             '32 Chemin Challet',
                             75001,
                             'Paris',
                             'Île-de-France',
                             86855);
                             
insert into departments values(56546,
                              'Department 75',
                              206,
                              49545);                             

                             
insert into employees values( 105,    
                             'David',    
                             'Austin',    
                             'DAUSTIN',    
                              5904234569,    
                              TO_DATE('25-06-2005', 'dd-MM-yyyy'),    
                              4800,   
                              3000,    
                              NULL,   
                              103,    
                               56546);
                               
insert into job_history values(105,
                               to_date('30.06.2005','dd.mm.yyyy'),
                               null,
                               4800,
                               56546);    
                                      

                             













