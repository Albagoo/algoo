Begin
for c in (select table_name from user_tables) loop
  execute immediate 'drop table'||c.table_name||'cascade constraints';
end loop;
End;
Begin
for c in (SELECT * FROM all_sequences WHERE SEQUENCE_OWNER='ALBAGOO') loop
  execute immediate 'drop SEQUENCE '||c.sequence_name;
end loop;
End;


