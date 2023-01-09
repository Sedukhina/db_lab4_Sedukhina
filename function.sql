--deleting reviews older then yearr
drop function if exists deleteOldReviews(int);
create function deleteOldReviews(yearr int) returns void
language plpgsql
as $$
begin
	delete from Reviews where Reviews.review_date in (select Reviews.review_date from Reviews where Reviews.review_date < yearr);
end;
$$;