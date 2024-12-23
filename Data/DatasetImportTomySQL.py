import mysql.connector
import pandas as pd
import numpy as np

# Database connection

#Ensure all tables are empty, replace parameters in connection with personal parameters. Make sure respective csv_files have the correct path. 

connection = mysql.connector.connect(
    host="username",       # Replace with your hostname
    user="root",            # Replace with your username
    password="password",  # Replace with your MySQL password
    database="databasename"   # Replace with your database name
)

cursor = connection.cursor()

# Paths to your CSV files
csv_files = {
    "users": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\users.csv",
    "region": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\region.csv",
    "location": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\location.csv",
    "addr_location": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\addr_location.csv",
    "restaurant": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\restaurant.csv",
    "country": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\country.csv",
    "religion": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\religion.csv",
    "business_owner": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\business_owner.csv",
    "business_affiliation": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\business_affiliation.csv",
    "demographic_stat": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\demographic_stat.csv",
    "research_query": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\research_query.csv",
    "query_result": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\query_result.csv",
    "food": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\food.csv",
    "popularity_stat": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\popularity_stat.csv",
    "analysis": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\analysis.csv",
    "region_preference": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\region_preference.csv",
    "country_ranks": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\country_ranks.csv",
    "food_preferences": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\food_preferences.csv",
    "dietary": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\dietary.csv",
    "practices": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\practices.csv",
    "service_style": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\service_style.csv",
    "serves": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\serves.csv",
    "franchise": "C:\\Users\\mkcli\\OneDrive\\Desktop\\Databases\\franchise.csv"
}

# Table insert queries
insert_queries = {
    "users": """
        INSERT INTO users (userid, first_name, last_name, date_joined)
        VALUES (%s, %s, %s, %s)
    """,
    "region": """
        INSERT INTO region (region_Name, reg_longitude, reg_latitude, populationSize, regArea, populationDensity)
        VALUES (%s, %s, %s, %s, %s, %s)
    """,
    "location": """
        INSERT INTO location (location_Size, loc_Latitude, loc_Longitude, region)
        VALUES (%s, %s, %s, %s)
    """,
    "addr_location": """
        INSERT INTO addr_location (address, loc_Latitude, loc_Longitude)
        VALUES (%s, %s, %s)
    """,
    "restaurant": """
        INSERT INTO restaurant (restaurant_Name, address, avgRating)
        VALUES (%s, %s, %s)
    """,
    "country": """
        INSERT INTO country (country_name, population, emmigration_rate, gdp)
        VALUES (%s, %s, %s, %s)
    """,
    "religion": """
        INSERT INTO religion (religion_name, dietary_permittance, vegetarian, vegan, Alcohol)
        VALUES (%s, %s, %s, %s, %s)
    """,
    "business_owner": """
        INSERT INTO business_owner (userid, budget)
        VALUES (%s, %s)
    """,
    "business_affiliation": """
        INSERT INTO business_affiliation (userid, affiliation)
        VALUES (%s, %s)
    """,
    "demographic_stat": """
        INSERT INTO demographic_stat (id, region, datecollected, youth, youngadult, middleaged, senior, incomeLevel)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """,
    "research_query": """
        INSERT INTO research_query (queryid, queryfunction, dateofquery, timeofquery, userid)
        VALUES (%s, %s, %s, %s, %s)
    """,
    "query_result": """
        INSERT INTO query_result (queryid, result)
        VALUES (%s, %s)
    """,
    "food": """
        INSERT INTO food (food_name, country_of_origin)
        VALUES (%s, %s)
    """,
    "popularity_stat": """
        INSERT INTO popularity_stat (id, location_lat, location_long, datecollected, foot_traffic, realestate_bracket)
        VALUES (%s, %s, %s, %s, %s, %s)
    """,
    "analysis": """
        INSERT INTO analysis (queryid, popStatID, DemoStatID)
        VALUES (%s, %s, %s)
    """,
    "region_preference": """
        INSERT INTO region_preference (users, region)
        VALUES (%s, %s)
    """,
    "country_ranks": """
        INSERT INTO country_ranks (country, demographicID, ranks)
        VALUES (%s, %s, %s)
    """,
    "food_preferences": """
        INSERT INTO food_preferences (userid, food)
        VALUES (%s, %s)
    """,
    "dietary": """
        INSERT INTO dietary (foodName, foodOrigin, diet)
        VALUES (%s, %s, %s)
    """,
    "practices": """
        INSERT INTO practices (country_name, religion_name)
        VALUES (%s, %s)
    """,
    "service_style": """
        INSERT INTO service_style (service_style, restaurant_name, restaurant_address)
        VALUES (%s, %s, %s)
    """,
    "serves": """
        INSERT INTO serves (restaurant, restaurant_address, food, food_origin)
        VALUES (%s, %s, %s, %s)
    """,
    "franchise": """
        INSERT INTO franchise (franchise_Name, franchise, franchise_address)
        VALUES (%s, %s, %s)
    """
}

# Iterate over datasets and insert data
for table, csv_path in csv_files.items():
    print(f"Processing table: {table}")
    try:
        # Load the CSV
        data = pd.read_csv(csv_path)

        # Replace empty strings, 'NULL', and NaN with None
        data.replace({np.nan: None, "": None, "NULL": None, "null": None}, inplace=True)

        # Prepare the data for insertion
        rows = data.values.tolist()

        # Insert the data
        cursor.executemany(insert_queries[table], rows)

        # Commit after each table
        connection.commit()

        print(f"Data successfully inserted into {table} table.")
    except Exception as e:
        print(f"Error inserting data into {table}: {e}")

# Close the cursor and connection
cursor.close()
connection.close()

print("All data successfully inserted.")
