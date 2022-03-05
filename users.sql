start transaction;


create user 'admin'@'%'
	identified by 'adminhaslo';

create user 'lekarz'@'%'
	identified by 'lekarzhaslo'
    password expire interval 180 day;
    
create user 'pielegniarka'@'%'
	identified by 'pielegniarkahaslo'
    password expire interval 180 day;
    
create user 'pacjent'@'%'
	identified by 'pacjenthaslo'
    password expire interval 30 day;
    
create user 'osobaupowazniona'@'%'
	identified by 'osobaupowaznionahaslo'
    password expire interval 30 day;
    
    
grant all privileges on *.* to 'admin'@'%';

grant select, insert, update, execute on *.* to 'lekarz'@'%';

grant select, insert, update, execute on *.* to 'pielegniarka'@'%';

grant select, execute on *.* to 'pacjent'@'%';

grant select, execute on *.* to 'osobaupowazniona'@'%';


flush privileges;


commit;