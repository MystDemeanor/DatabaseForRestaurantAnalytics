# Create a new 5 star restaurant in the first alphabetical address in a chosen location
INSERT INTO restaurant
values ("Toby's Bar and Grill", (select address 
								from addr_location
                                where loc_Latitude = 42.074769
								AND loc_Longitude = -80.331700 limit 1) ,5);
                     
# The insert of  “Los Pollos Hermanos” is allocated via a SELECT statement such that all business owners with a budget of over $50,000. 
# This was added as a gimmick to represent the possibility of co ownership via stock.
INSERT INTO business_affiliation (userid, affiliation)
SELECT userid, 'Los Pollos Hermanos'
FROM business_owner
WHERE budget > 50000;

# Latitudes and longitudes from “Locations” and a region, “Stratford”, are taken and given values for foot traffic and real-estate bracket. 
# They are then inserted into popularity stats.
INSERT INTO popularity_stat (id, location_lat, location_long, datecollected, foot_traffic, realestate_bracket)
SELECT ROW_NUMBER() OVER (ORDER BY loc_Latitude, loc_Longitude) AS id, 
       loc_Latitude, 
       loc_Longitude, 
       CURDATE(), 
       1000, 
       750000
FROM Location
WHERE region = 'Stratford';