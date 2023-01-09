--Information about companies in state
drop procedure if exists companies_in_state(char(20));
create or replace procedure companies_in_state(cstate char(20))
language plpgsql
as $$
declare comp_name Companies.company_name%type;
declare comp_city Companies.company_city%type;
declare comp_owner Companies.company_owner%type;

begin
	select company_name, company_city, company_owner into comp_name, comp_city, comp_owner from companies where company_state = cstate;
	raise info 'Company name %, Company city %, Company owner %', trim(comp_name), trim(comp_city), trim(comp_owner);
end;
$$