#The goal of this view is to display the foods being served in a restaurant only if those foods are of Kenyan origin. 
CREATE VIEW dishesServed (restaurant, food)
AS SELECT restaurant, GROUP_CONCAT(food) AS foodList
FROM Serves
WHERE food_origin = 'kenya'
GROUP BY restaurant;
DROP VIEW dishesServed;
#The above VIEW shows a list of foods for each restaurant so long as their comes from Brazil. 
#mySQL cannot directly find the specific line to update due to this aggregation. Therefore, it is not updatable.
INSERT INTO dishesServed
	VALUES ('casa_manioca','pacoca', 'Brazil');

SELECT * FROM dishesServed;

#The goal of this view is to display how a certain restaurant serves their food. This should give the user an idea of the competition's style of service.
CREATE VIEW mannerOfService (restaurant_Name, franchise_name, service_style)
AS SELECT franch.franchise_name, style.restaurant_Name, style.service_style
FROM Franchise franch, Service_Style style
WHERE franch.franchise_Name = style.restaurant_Name;
DROP VIEW mannerOfService;

#The above VIEW shows a list restaurant names, whether they are a franchise, and how they serve their food. 
#The reason why it is not updatable and an insert does not follow through is that there's a join between franchise_Name and restaurant_Name.
#This makes it ambigous for the machine to know where to update "McDonald's" (Franchise or Restaurant table), hence causing the updatability issue.
INSERT INTO mannerOfService (restaurant_Name, franchise_name, service_style)
	VALUE ("McDonald's", 'YES', 'fast food');

SELECT * FROM mannerOfService LIMIT 30;
