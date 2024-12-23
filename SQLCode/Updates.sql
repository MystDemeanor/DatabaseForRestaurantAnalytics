# set business own budget to the average realestate bracket of a region
# uses subquery with aggregates
Update business_owner
	set budget = (select avg(realestate_bracket) 
				from popularity_stat ps
                where ps.location_lat IN (select loc_Latitude from location where region = 'london')
				AND ps.location_long IN (select loc_Longitude from location where region = 'london'))
	where userid = 'U535000510';

# Increase the ratings of all restaurants in a region 
# requires double nested select
Update restaurant
	set avgRating = avgRating + 1
    where (address IN (select address 
		from addr_location al
        where al.loc_Latitude IN (select loc_Latitude from location where region = 'Stratford')
			AND al.loc_longitude IN (select loc_Longitude from location where region = 'Stratford'))
		)
		AND (avgRating*1.1 < 5);
  
# Delete the lowest rated restaurant in a location with a certain service style  
Delete FROM restaurant
	where address IN (select address from addr_location 
								where loc_Latitude = 42.074769
								and loc_Longitude = -80.331700)
	AND restaurant_name IN (select restaurant_name 
			from service_style
			where service_style = 'Pop-up')
	ORDER BY avgRating LIMIT 1;