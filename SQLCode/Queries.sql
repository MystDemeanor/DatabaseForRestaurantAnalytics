#Query 1: Queries Users have Created
SELECT u.userid, r.queryid, r.dateofquery, r.timeofquery, r.queryfunction  
FROM users u JOIN research_Query r USING (userid)  
LIMIT 20;
    
#Query 2: Shows the Preferences of a Given User 
SELECT s.*, p.region, f.food  
FROM users s
	JOIN Region_Preference p ON s.userid = p.users  
	JOIN Food_Preferences f ON s.userid = f.userid
WHERE s.userid = ("U178446697") #In quotes replace with targeted userid
LIMIT 20;

#Query 3: List all the User that have Two Selected Preferences and their Information 
SELECT users.*, f.food, r.region
FROM users
	JOIN food_preferences f ON users.userid = f.userid
    JOIN region_preference r ON Users.userid = r.users
WHERE f.food = 'Bratwurst' AND r.region = 'Brampton'; #In quotes replace with targeted food and region

#Query 4: List the Locations, Demographics Stats, Popularity Stats, in a Chosen Region for a Chosen Date 
SELECT  r.region_Name, l.location_Size, p.foot_traffic, p.realestate_bracket, 
d.youth, d.youngadult, d.middleaged, d.senior, d.incomeLevel, p.datecollected
FROM region r
	JOIN Location l ON r.region_Name = l.region
	JOIN demographic_stat d ON r.region_Name = d.region 
	JOIN popularity_stat p ON d.datecollected = p.datecollected AND l.loc_Latitude = p.location_lat AND l.loc_Longitude = p.location_long
WHERE r.region_Name = 'Mississauga' AND p.datecollected = '2020-05-02' #In quotes replace with targeted date collected and region
ORDER BY r.region_Name, p.datecollected;    

#Query 5: Analyze Real-Estate and Foot Traffic Metrics by Location 

SELECT reg.region_Name, loc.loc_Latitude, loc.loc_Longitude, ps.realestate_bracket AS real_estate_cost, 
ps.foot_traffic AS foot_traffic
FROM region reg
	JOIN Location loc ON reg.region_Name = loc.region
	JOIN popularity_stat ps ON loc.loc_Latitude = ps.location_lat AND loc.loc_Longitude = ps.location_long
WHERE ps.datecollected = '2021-10-10'; #In quotes replace with target date collected

#Query 6: Analyze Foot Traffic for Locations with Specific Cuisines   

SELECT loc.loc_Latitude, loc.loc_Longitude, rest.restaurant_Name, ps.foot_traffic
FROM Restaurant rest
	JOIN Addr_Location addr ON rest.address = addr.address
	JOIN Location loc ON addr.loc_Latitude = loc.loc_Latitude AND addr.loc_Longitude = loc.loc_Longitude
	JOIN popularity_stat ps ON loc.loc_Latitude = ps.location_lat AND loc.loc_Longitude = ps.location_long
	JOIN Serves s ON rest.restaurant_Name = s.restaurant AND rest.address = s.restaurant_address
WHERE s.food = 'Salad' 
	AND ps.datecollected = '2022-08-07' #In quotes replace with target date collected and food
	AND ps.location_lat = addr.loc_Latitude 
	AND ps.location_long = addr.loc_Longitude
ORDER BY ps.foot_traffic DESC;

#Query 7: List the Most Popular Restaurants by Foot Traffic  

SELECT r.restaurant_Name, r.address, ps.location_lat, ps.location_long, ps.foot_traffic
FROM Restaurant r
	JOIN Addr_Location al ON r.address = al.address
	JOIN Location l ON al.loc_Latitude = l.loc_Latitude AND al.loc_Longitude = l.loc_Longitude
	JOIN popularity_stat ps ON l.loc_Latitude = ps.location_lat AND l.loc_Longitude = ps.location_long
WHERE (r.restaurant_Name, ps.location_lat, ps.location_long, ps.foot_traffic) IN (
    SELECT MIN(rSub.restaurant_Name), psSub.location_lat, psSub.location_long, psSub.foot_traffic
    FROM Restaurant rSub
		JOIN Addr_Location alSub ON rSub.address = alSub.address
		JOIN Location lSub ON alSub.loc_Latitude = lSub.loc_Latitude AND alSub.loc_Longitude = lSub.loc_Longitude
		JOIN popularity_stat psSub ON lSub.loc_Latitude = psSub.location_lat AND lSub.loc_Longitude = psSub.location_long
    GROUP BY psSub.location_lat, psSub.location_long, psSub.foot_traffic
)
ORDER BY ps.foot_traffic DESC
LIMIT 20;

#Query 8: List the Foods Served and the Restaurants, for a Given Country (Ex. Italy) 
SELECT c.country_name, f.food_name, s.restaurant, s.restaurant_address
FROM serves s
	JOIN food f ON s.food = f.food_name AND  s.food_origin = f.country_of_origin
	JOIN country c ON f.country_of_origin = c.country_name
WHERE c.country_name='Canada' #In quotes replace with target country
LIMIT 20;

#Query 9: Shows the Restaurants with the Specified Dietary Constraint  
SELECT s.food, s.restaurant, s.restaurant_address
FROM serves s
WHERE EXISTS (
	SELECT 1
	FROM dietary d
	WHERE s.food = d.foodName AND s.food_origin = d.foodOrigin AND d.diet = 'vegan'
 )
 LIMIT 20 ;

#Query 10: Counts the Number of Restaurants in a Chosen Region that Serve a Chosen Food
SELECT r.region_Name, COUNT(DISTINCT s.restaurant) AS restaurant_count
FROM serves s
	JOIN restaurant res ON s.restaurant = res.restaurant_Name AND s.restaurant_address = res.address
	JOIN addr_location al ON res.address = al.address
	JOIN location l ON al.loc_Latitude = l.loc_Latitude AND al.loc_Longitude = l.loc_Longitude
	JOIN region r ON l.region = r.region_Name
WHERE s.food = 'pasta' AND r.region_Name = 'Brampton'  #In quotes replace with target food and region
GROUP BY r.region_Name;
