set linesize 200;
set long 5000;
select constraint_name, search_condition from user_constraints where table_name='BOOKINGS';
exit;
