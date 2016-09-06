select * from  RECRUITMENT 
where rec_code='rec00001';

insert into RECRUITMENT values('rec00005',
 '전단지 배포 아르바이트/ 일급 10만원',
 'none',
 '대신광고',
 sysdate,
 10,  --varchar2
'무관',
20,   --varchar2
'고졸이상',
'알바',
'map.jpg',
'누구나 쉽게 할수 있는 아르바이트 이므로 걱정하지 않으셔도 됩니다.',
0,
'N',
'Y',
'서비스',
'전단지',
'1개월-3개월',
'월-금',
'협의가능',
'중식제공',
100000,
'none',
'none',
'none' );
select * from  company;
insert into company(comp_code, region_code,comp_code2 ) 
               values('none', 'none','none' );
               
select * from  region;               
insert into region(region_code ) values('none' );        

select * from  auth;
insert into auth(authcode ) values(2 );

select * from  comp_meber;          --comp_member
insert into comp_meber(comp_code,userid,password,username,birth,region_code,authcode ) values('none','none','none','none','none','none','none' );

 select * from  subway;
 
 insert into subway(subway_code ) values('none' );
 
 select * from  service;
 insert into service(service_code ) values('none' );  
 
 
 commit;
 
 select service_code,grade, deadline, trunc(deadline-sysdate)as days from  service;
 
 update company set hp3='4444' 
 
 
 