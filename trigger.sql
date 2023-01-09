--Adds current date to new reviews 
drop trigger if exists add_review_date_now on reviews;

create or replace function review_date_now() returns trigger
language plpgsql
as $$
begin
	new.review_date := extract(year from now());
	return new;
end;
$$;

create trigger add_review_date_now before insert on reviews for each row execute procedure review_date_now();