select * from  RECRUITMENT 
where rec_code='rec00001';

insert into RECRUITMENT values('rec00005',
 '������ ���� �Ƹ�����Ʈ/ �ϱ� 10����',
 'none',
 '��ű���',
 sysdate,
 10,  --varchar2
'����',
20,   --varchar2
'�����̻�',
'�˹�',
'map.jpg',
'������ ���� �Ҽ� �ִ� �Ƹ�����Ʈ �̹Ƿ� �������� �����ŵ� �˴ϴ�.',
0,
'N',
'Y',
'����',
'������',
'1����-3����',
'��-��',
'���ǰ���',
'�߽�����',
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
 
 
 