CREATE DATABASE AllInfo;
USE AllInfo;

Create TABLE users( 
	userid varchar(10) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    date_joined DATE NOT NULL,
    PRIMARY KEY (userid));
    
CREATE TABLE region(
	region_Name VARCHAR(100) NOT NULL,
	reg_longitude DECIMAL (9,6) NOT NULL,
	reg_latitude DECIMAL (9,6) NOT NULL,
	populationSize INT NOT NULL,
	regArea INT NOT NULL,
    CHECK (populationsize > 0),
    CHECK (regArea > 0),
	populationDensity DECIMAL(6,2),
	PRIMARY KEY (region_Name));

CREATE TABLE Location(
	location_Size INT NOT NULL, 
	loc_Latitude DECIMAL (9,6) NOT NULL,
	loc_Longitude DECIMAL (9,6) NOT NULL,
	region VARCHAR(100) NOT NULL,
	PRIMARY KEY (loc_Latitude, loc_Longitude),
	FOREIGN KEY (region) REFERENCES Region(region_Name) 
		ON DELETE NO ACTION
        ON UPDATE CASCADE);    

CREATE TABLE Addr_Location(
	address VARCHAR(100) NOT NULL,
	loc_Latitude DECIMAL (9,6) NOT NULL,
	loc_Longitude DECIMAL (9,6) NOT NULL,
	PRIMARY KEY (address),
	FOREIGN KEY (loc_Latitude,loc_Longitude) REFERENCES Location(loc_Latitude,loc_Longitude) 
		ON DELETE CASCADE
        ON UPDATE CASCADE);

CREATE TABLE Restaurant(
    restaurant_Name VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    avgRating DECIMAL(3,2),
    PRIMARY KEY (restaurant_Name, address), 
    FOREIGN KEY (address) REFERENCES addr_Location(address) 
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
    
CREATE TABLE country(
	country_name varchar(100) NOT NULL,
    population INTEGER NOT NULL,
    emmigration_rate DECIMAL(5,2),
    gdp BIGINT NOT NULL CHECK(gdp>0),
    PRIMARY KEY (country_name));
    
CREATE TABLE religion(
	religion_name varchar(100) NOT NULL,
    dietary_permittance varchar(100),
    vegetarian BOOLEAN NOT NULL DEFAULT false,
    vegan BOOLEAN NOT NULL DEFAULT false,
    Alcohol BOOLEAN NOT NULL DEFAULT true,
    CHECK(NOT(vegan AND NOT vegetarian)),
    primary key (religion_name));

Create Table business_owner(
	userid varchar(10) NOT NULL,
    budget INTEGER NOT NULL DEFAULT 10000 CHECK(budget > 0),
    PRIMARY KEY (userid),
    Foreign Key(userid) References users(userid)
		On Delete CASCADE
        ON UPDATE CASCADE);
        
Create Table business_affiliation(
	userid varchar(10) NOT NULL,
    affiliation varchar(100) NOT NULL,
    PRIMARY KEY (userid, affiliation),
    Foreign Key(userid) References business_owner(userid)
		On Delete CASCADE
        ON UPDATE CASCADE);

Create Table demographic_stat(
	id INTEGER NOT NULL,
    region varchar(100) NOT NULL,
    datecollected Date NOT NULL,
    youth DECIMAL(2,2),
    youngadult DECIMAL(2,2),
    middleaged DECIMAL(2,2),
    senior DECIMAL(2,2),
    incomeLevel INTEGER,
    CHECK(youth+youngadult+middleaged+senior=1),
    PRIMARY KEY (id),
    UNIQUE (region, datecollected),
    Foreign Key(region) References region(region_name)
		On Delete RESTRICT
        ON UPDATE CASCADE);
		
Create Table research_query(
	queryid INTEGER NOT NULL,
    queryfunction varchar(100) NOT NULL,
    dateofquery DATE NOT NULL,
    timeofquery TIME NOT NULL,
    userid varchar(10) NOT NULL,
	PRIMARY KEY (queryid),
    UNIQUE(dateofquery,timeofquery,userid),
    FOREIGN KEY(userid) REFERENCES users(userid)
		ON DELETE CASCADE
        ON UPDATE CASCADE);

Create Table query_result(
	queryid INTEGER NOT NULL,
    result varchar(100) NOT NULL,
    PRIMARY KEY (queryid, result),
    FOREIGN KEY(queryid) REFERENCES research_query(queryid)
		ON DELETE CASCADE
        ON UPDATE CASCADE);
        
Create Table food(
	food_name varchar(100) NOT NULL,
    country_of_origin varchar(100) NOT NULL,
    PRIMARY KEY (food_name, country_of_origin),
    FOREIGN KEY (country_of_origin) REFERENCES country(country_name)
		ON DELETE restrict
        ON UPDATE CASCADE);
        
Create Table popularity_stat(
	id INT NOT NULL,
    location_lat DECIMAL (9,6) NOT NULL,
    location_long DECIMAL (9,6) NOT NULL,
    datecollected Date NOT NULL,
    foot_traffic INTEGER DEFAULT (1),
    realestate_bracket INTEGER DEFAULT(500000),
    CHECK(foot_traffic > 0),
    CHECK(realestate_bracket > 0),
    PRIMARY KEY (id),
    UNIQUE (location_lat, location_long, datecollected),
    Foreign Key(location_lat, location_long) References location(loc_latitude, loc_Longitude)
		On Delete No Action
        ON UPDATE CASCADE);
        
CREATE TABLE Analysis (
	QueryID INT NOT NULL,
	popStatID INT NOT NULL,
	DemoStatID INT NOT NULL,
	PRIMARY KEY (QueryID, popStatID, DemoStatID),
	FOREIGN KEY (QueryID) REFERENCES research_query(queryID)
		On Delete CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (popStatID) REFERENCES popularity_stat(ID)
		On Delete cascade
        ON UPDATE cascade,
	FOREIGN KEY (DemoStatID) REFERENCES Demographic_Stat(ID)
		On Delete cascade
        ON UPDATE cascade);

CREATE TABLE Region_Preference(
	Users varchar(10) NOT NULL,
	Region VARCHAR(100) NOT NULL,
	PRIMARY KEY (Users, Region),
	FOREIGN KEY (Users) REFERENCES Users(UserID)
		On Delete CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (Region) REFERENCES Region(region_Name)
		On Delete Cascade
        ON UPDATE CASCADE);

CREATE TABLE Country_Ranks(
	 Country VARCHAR(100) NOT NULL,
	 DemographicID INT NOT NULL,
	 Ranks INT NOT NULL CHECK(ranks>0),
	 PRIMARY KEY (Country, DemographicID),
	 UNIQUE (DemographicID, Ranks),
	 FOREIGN KEY (Country) REFERENCES Country(country_Name)
			On Delete RESTRICT
			ON UPDATE CASCADE,
	 FOREIGN KEY (DemographicID) REFERENCES Demographic_Stat(ID)
			On Delete CASCADE
			ON UPDATE CASCADE);

CREATE TABLE Food_Preferences(
	userid varchar(10) NOT NULL,
	food VARCHAR(50) NOT NULL,
	PRIMARY KEY (userid, food),
	FOREIGN KEY (userid) REFERENCES Users(userid)
			On Delete CASCADE
			ON UPDATE CASCADE,
	FOREIGN KEY (food) REFERENCES Food(food_name)
			On Delete CASCADE
			ON UPDATE CASCADE);

CREATE TABLE Dietary(
	foodName VARCHAR(100) NOT NULL,
	foodOrigin VARCHAR(100) NOT NULL,
	diet VARCHAR(100) NOT NULL,
	PRIMARY KEY (foodName, foodOrigin, diet),
	FOREIGN KEY (foodName, foodOrigin) REFERENCES food(food_name, country_of_origin)
		On Delete CASCADE
        ON UPDATE CASCADE);


CREATE TABLE Practices(
	country_name VARCHAR(100) NOT NULL,
	religion_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (country_name, religion_name),
	FOREIGN KEY (religion_name) REFERENCES religion(religion_name)
			On Delete RESTRICT
			ON UPDATE CASCADE,
	FOREIGN KEY (country_name) REFERENCES country(country_name)
			On Delete CASCADE
			ON UPDATE CASCADE);

CREATE TABLE Service_Style(
	service_style VARCHAR(100) NOT NULL,
	restaurant_name VARCHAR(100) NOT NULL,
	restaurant_address varchar(100) NOT NULL,
	PRIMARY KEY (service_style, restaurant_name, restaurant_address),
	FOREIGN KEY (restaurant_name,restaurant_address) REFERENCES restaurant(restaurant_name,address)
		On Delete CASCADE
        ON UPDATE CASCADE);

CREATE TABLE Serves(
	restaurant VARCHAR(100) NOT NULL,
	restaurant_address VARCHAR(100) NOT NULL,
	food VARCHAR(100) NOT NULL,
	food_origin VARCHAR(100) NOT NULL,
	PRIMARY KEY (restaurant, restaurant_address, food, food_origin),
	FOREIGN KEY (restaurant,restaurant_address) REFERENCES restaurant(restaurant_name,address)
		On Delete CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (food, food_origin) REFERENCES food(food_name, country_of_origin)
		On Delete restrict
        ON UPDATE CASCADE);
        
CREATE TABLE Franchise(
	franchise_Name VARCHAR(100) NOT NULL,
	franchise BOOLEAN NOT NULL,
    franchise_address VARCHAR(100) NOT NULL,
	PRIMARY KEY (franchise_Name, franchise, franchise_address),
	FOREIGN KEY (franchise_Name, franchise_address) REFERENCES Restaurant(restaurant_Name, address) 
		ON DELETE CASCADE 
        ON UPDATE CASCADE);

DESCRIBE users;
DESCRIBE Location;
DESCRIBE Addr_Location;
DESCRIBE restaurant;
DESCRIBE country;
DESCRIBE religion;
DESCRIBE business_owner;
DESCRIBE business_affiliation;
DESCRIBE demographic_stat;
DESCRIBE research_query;
DESCRIBE query_result;
DESCRIBE food;
DESCRIBE popularity_stat;
DESCRIBE analysis;            
DESCRIBE region_preference;
DESCRIBE country_ranks;
DESCRIBE food_preferences;
DESCRIBE dietary;
DESCRIBE practices;
DESCRIBE service_style;
DESCRIBE serves;
DESCRIBE franchise;