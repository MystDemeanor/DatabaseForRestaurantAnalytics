from tkinter import *
from tkinter import ttk, messagebox
import mysql.connector


# Connect to the database
def connect_to_db():
    try:
        connection = mysql.connector.connect(
            host="DESKTOP-GRA7HU1",
            user="root",
            password="HypeBeast15!",  # Replace with your password
            database="allinfo"
        )
        return connection
    except mysql.connector.Error as err:
        messagebox.showerror("Database Connection Error", f"Error: {err}")
        return None


# Execute a query and return results
def execute_query(query, params=()):
    connection = connect_to_db()
    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute(query, params)
            if query.strip().lower().startswith("select"):
                columns = [desc[0] for desc in cursor.description]
                rows = cursor.fetchall()
                connection.close()
                return columns, rows
            else:
                connection.commit()
                row_count = cursor.rowcount
                connection.close()
                return None, f"Query executed successfully: {row_count} rows affected."
        except mysql.connector.Error as err:
            return None, f"Error executing query: {err}"


# Display results in a table
def display_results(frame, columns, rows):
    for widget in frame.winfo_children():
        widget.destroy()

    if columns and rows:
        scroll_y = Scrollbar(frame, orient=VERTICAL)
        scroll_x = Scrollbar(frame, orient=HORIZONTAL)

        table = ttk.Treeview(
            frame, columns=columns, show="headings",
            yscrollcommand=scroll_y.set, xscrollcommand=scroll_x.set
        )

        for col in columns:
            table.heading(col, text=col)
            table.column(col, anchor=CENTER, width=120)

        scroll_y.pack(side=RIGHT, fill=Y)
        scroll_x.pack(side=BOTTOM, fill=X)

        scroll_y.config(command=table.yview)
        scroll_x.config(command=table.xview)

        table.pack(fill=BOTH, expand=True)

        for row in rows:
            table.insert("", END, values=row)
    else:
        Label(frame, text="No Results Found.", font=("Arial", 12)).pack()


# Generic page handler
def handle_query_page(query_title, query, inputs=None):
    clear_frame(main_frame)

    # Header
    Label(main_frame, text=query_title, bg="white", font=("Arial", 16, "bold")).grid(
        row=0, column=0, columnspan=2, sticky=W, padx=20, pady=10
    )

    # Input fields
    entries = {}
    if inputs:
        for idx, input_label in enumerate(inputs):
            Label(main_frame, text=input_label, bg="white", font=("Arial", 12)).grid(
                row=1 + idx, column=0, sticky=W, padx=20, pady=5
            )
            entry = ttk.Entry(main_frame, font=("Arial", 12))
            entry.grid(row=1 + idx, column=1, sticky=W, padx=5, pady=5)
            entries[input_label] = entry

    # Results frame
    results_frame = Frame(main_frame)
    results_frame.grid(row=3 + len(inputs or []), column=0, columnspan=2, padx=20, pady=10, sticky=NSEW)

    main_frame.rowconfigure(3 + len(inputs or []), weight=1)
    main_frame.columnconfigure(1, weight=1)

    # Execute query
    def execute():
        params = tuple(entry.get() for entry in entries.values())
        columns, rows = execute_query(query, params)
        display_results(results_frame, columns, rows)

    # Run button
    Button(main_frame, text="Run Query", command=execute, font=("Arial", 12)).grid(
        row=2 + len(inputs or []), column=0, columnspan=2, pady=10
    )


# Query functions
def query1_page():
    query = """
        SELECT u.userid, r.queryid, r.dateofquery, r.timeofquery, r.queryfunction  
        FROM users u JOIN research_Query r USING (userid)
    """
    handle_query_page("Query 1: Queries Users Created", query)


def query2_page():
    query = """
        SELECT s.userid, s.first_name, s.last_name, s.date_joined, p.region, f.food  
        FROM users s
        JOIN Region_Preference p ON s.userid = p.users  
        JOIN Food_Preferences f ON s.userid = f.userid
        WHERE s.userid = %s
    """
    handle_query_page("Query 2: User Preferences", query, inputs=["Enter UserID:"])


def query3_page():
    query = """
        SELECT users.*, f.food, r.region
        FROM users
        JOIN food_preferences f ON users.userid = f.userid
        JOIN region_preference r ON users.userid = r.users
        WHERE f.food = %s AND r.region = %s
    """
    handle_query_page("Query 3: Users with Two Preferences", query, inputs=["Enter Food Preference:", "Enter Region Preference:"])


def query4_page():
    query = """
        SELECT r.region_Name, l.location_Size, p.foot_traffic, p.realestate_bracket, 
               d.youth, d.youngadult, d.middleaged, d.senior, d.incomeLevel, p.datecollected
        FROM region r
        JOIN Location l ON r.region_Name = l.region
        JOIN demographic_stat d ON r.region_Name = d.region 
        JOIN popularity_stat p ON d.datecollected = p.datecollected 
                                AND l.loc_Latitude = p.location_lat 
                                AND l.loc_Longitude = p.location_long
        WHERE r.region_Name = %s AND p.datecollected = %s
    """
    handle_query_page("Query 4: Locations, Demographics, Popularity", query, inputs=["Enter Region:", "Enter Date (YYYY-MM-DD):"])


def query5_page():
    query = """
        SELECT reg.region_Name, loc.loc_Latitude, loc.loc_Longitude, 
               ps.realestate_bracket AS real_estate_cost, ps.foot_traffic AS foot_traffic
        FROM region reg
        JOIN Location loc ON reg.region_Name = loc.region
        JOIN popularity_stat ps ON loc.loc_Latitude = ps.location_lat 
                                AND loc.loc_Longitude = ps.location_long
        WHERE ps.datecollected = %s
    """
    handle_query_page("Query 5: Real-Estate and Foot Traffic Metrics", query, inputs=["Enter Date (YYYY-MM-DD):"])


def query6_page():
    query = """
        SELECT loc.loc_Latitude, loc.loc_Longitude, rest.restaurant_Name, ps.foot_traffic
        FROM Restaurant rest
        JOIN Addr_Location addr ON rest.address = addr.address
        JOIN Location loc ON addr.loc_Latitude = loc.loc_Latitude AND addr.loc_Longitude = loc.loc_Longitude
        JOIN popularity_stat ps ON loc.loc_Latitude = ps.location_lat AND loc.loc_Longitude = ps.location_long
        JOIN Serves s ON rest.restaurant_Name = s.restaurant AND rest.address = s.restaurant_address
        WHERE s.food = %s AND ps.datecollected = %s
        ORDER BY ps.foot_traffic DESC
    """
    handle_query_page("Query 6: Analyze Foot Traffic by Cuisine", query, inputs=["Enter Cuisine:", "Enter Date (YYYY-MM-DD):"])

def query7_page():
    query = """
        SELECT r.restaurant_Name, r.address, ps.location_lat, ps.location_long, ps.foot_traffic
        FROM Restaurant r
        JOIN Addr_Location al ON r.address = al.address
        JOIN Location l ON al.loc_Latitude = l.loc_Latitude AND al.loc_Longitude = l.loc_Longitude
        JOIN popularity_stat ps ON l.loc_Latitude = ps.location_lat AND l.loc_Longitude = ps.location_long
        ORDER BY ps.foot_traffic DESC
    """
    handle_query_page("Query 7: Most Popular Restaurants by Foot Traffic", query)

def query8_page():
    query = """
        SELECT c.country_name, f.food_name, s.restaurant, s.restaurant_address
        FROM serves s
        JOIN food f ON s.food = f.food_name AND s.food_origin = f.country_of_origin
        JOIN country c ON f.country_of_origin = c.country_name
        WHERE c.country_name = %s
    """
    handle_query_page(
        "Query 8: Foods Served by Restaurants in a Country",
        query,
        inputs=["Enter Country:"],
    )

def query9_page():
    query = """
        SELECT s.food, s.restaurant, s.restaurant_address
        FROM serves s
        WHERE EXISTS (
            SELECT 1
            FROM dietary d
            WHERE s.food = d.foodName AND s.food_origin = d.foodOrigin AND d.diet = %s
        )
    """
    handle_query_page(
        "Query 9: Restaurants with Dietary Constraints",
        query,
        inputs=["Enter Dietary Constraint:"],
    )

def query10_page():
    query = """
        SELECT r.region_Name, COUNT(DISTINCT s.restaurant) AS restaurant_count
        FROM serves s
        JOIN restaurant res ON s.restaurant = res.restaurant_Name AND s.restaurant_address = res.address
        JOIN addr_location al ON res.address = al.address
        JOIN location l ON al.loc_Latitude = l.loc_Latitude AND al.loc_Longitude = l.loc_Longitude
        JOIN region r ON l.region = r.region_Name
        WHERE s.food = %s AND r.region_Name = %s
        GROUP BY r.region_Name
    """
    handle_query_page(
        "Query 10: Restaurant Count by Food and Region",
        query,
        inputs=["Enter Food:", "Enter Region:"],
    )

def insert_page():
    clear_frame(main_frame)

    # Header
    Label(main_frame, text="Insert: New Restaurant", bg="white", font=("Arial", 16, "bold")).grid(row=0, column=0, columnspan=2, sticky=W, padx=20, pady=10)

    # Input Fields
    Label(main_frame, text="Enter Restaurant Name:", bg="white", font=("Arial", 12)).grid(row=1, column=0, sticky=W, padx=20, pady=5)
    name_entry = ttk.Entry(main_frame, font=("Arial", 12))
    name_entry.grid(row=1, column=1, sticky=W, padx=5, pady=5)

    Label(main_frame, text="Select Latitude:", bg="white", font=("Arial", 12)).grid(row=2, column=0, sticky=W, padx=20, pady=5)
    latitude_combobox = ttk.Combobox(main_frame, font=("Arial", 12), state="readonly")
    latitude_combobox.grid(row=2, column=1, sticky=W, padx=5, pady=5)

    Label(main_frame, text="Select Longitude:", bg="white", font=("Arial", 12)).grid(row=3, column=0, sticky=W, padx=20, pady=5)
    longitude_combobox = ttk.Combobox(main_frame, font=("Arial", 12), state="readonly")
    longitude_combobox.grid(row=3, column=1, sticky=W, padx=5, pady=5)

    # Populate Latitude and Longitude from the database
    address_query = """
    SELECT DISTINCT loc_Latitude, loc_Longitude
    FROM addr_location
    ORDER BY loc_Latitude ASC, loc_Longitude ASC;
    """
    _, address_data = execute_query(address_query)
    if address_data:
        latitudes = sorted(set(row[0] for row in address_data))
        longitudes = sorted(set(row[1] for row in address_data))
        latitude_combobox['values'] = latitudes
        longitude_combobox['values'] = longitudes

    # Results Frame
    results_frame = Frame(main_frame, bg="white")
    results_frame.grid(row=6, column=0, columnspan=2, sticky=NSEW, padx=20, pady=10)
    main_frame.rowconfigure(6, weight=1)
    main_frame.columnconfigure(1, weight=1)

    def execute():
        name = name_entry.get()
        latitude = latitude_combobox.get()
        longitude = longitude_combobox.get()

        # Validate inputs
        if not name:
            for widget in results_frame.winfo_children():
                widget.destroy()
            Label(results_frame, text="Error: Restaurant Name cannot be empty.", font=("Arial", 12), bg="white", fg="red").pack()
            return

        if not latitude or not longitude:
            for widget in results_frame.winfo_children():
                widget.destroy()
            Label(results_frame, text="Error: Please select both Latitude and Longitude.", font=("Arial", 12), bg="white", fg="red").pack()
            return

        # Check if the latitude and longitude pair exists in the dataset
        check_location_query = """
        SELECT address FROM addr_location
        WHERE loc_Latitude = %s AND loc_Longitude = %s;
        """
        _, location_exists = execute_query(check_location_query, (latitude, longitude))

        for widget in results_frame.winfo_children():
            widget.destroy()

        if not location_exists:
            Label(results_frame, text="Error: The selected latitude and longitude do not exist in the dataset.", font=("Arial", 12), bg="white", fg="red").pack()
            Label(results_frame, text="Suggestions:", font=("Arial", 12, "bold"), bg="white").pack(pady=5)
            for lat, lon in address_data[:10]:  # Show top 10 suggestions
                Label(results_frame, text=f"Latitude: {lat}, Longitude: {lon}", font=("Arial", 12), bg="white").pack()
            return

        # Check if the restaurant already exists at the location
        check_query = """
        SELECT 1 FROM restaurant r
        JOIN addr_location al ON r.address = al.address
        WHERE r.restaurant_Name = %s
        AND al.loc_Latitude = %s
        AND al.loc_Longitude = %s;
        """
        _, exists = execute_query(check_query, (name, latitude, longitude))

        if exists:
            Label(results_frame, text="Error: A restaurant with the same name already exists at this location.", font=("Arial", 12), bg="white", fg="red").pack()
            return

        # Insert the new restaurant
        insert_query = """
        INSERT INTO restaurant (restaurant_Name, address, avgRating)
        VALUES (
            %s,
            (SELECT address
             FROM addr_location
             WHERE loc_Latitude = %s AND loc_Longitude = %s
             ORDER BY address ASC LIMIT 1),
            5
        );
        """
        _, message = execute_query(insert_query, (name, latitude, longitude))

        if "successfully" in message:
            # Display the newly inserted restaurant
            fetch_query = """
            SELECT r.restaurant_Name, r.address, r.avgRating
            FROM restaurant r
            JOIN addr_location al ON r.address = al.address
            WHERE r.restaurant_Name = %s
            AND al.loc_Latitude = %s
            AND al.loc_Longitude = %s;
            """
            columns, rows = execute_query(fetch_query, (name, latitude, longitude))
            if columns:
                display_results(results_frame, columns, rows)
        else:
            Label(results_frame, text=f"Error: {message}", font=("Arial", 12), bg="white", fg="red").pack()

    # "Run Insert" Button
    Button(main_frame, text="Run Insert", activebackground="orange", command=execute, font=("Arial", 12)).grid(row=5, column=0, columnspan=2, pady=10)

def update_page():
    clear_frame(main_frame)

    # Header
    Label(main_frame, text="Update: Region's Restaurant Ratings", bg="white", font=("Arial", 16, "bold")).grid(row=0, column=0, columnspan=2, sticky=W, padx=20, pady=10)

    # Input Fields
    Label(main_frame, text="Enter Region:", bg="white", font=("Arial", 12)).grid(row=1, column=0, sticky=W, padx=20, pady=5)
    region_entry = ttk.Entry(main_frame, font=("Arial", 12))
    region_entry.grid(row=1, column=1, sticky=W, padx=5, pady=5)

    # Results Frame
    results_frame = Frame(main_frame, bg="white")
    results_frame.grid(row=3, column=0, columnspan=2, sticky=NSEW, padx=20, pady=10)
    main_frame.rowconfigure(3, weight=1)
    main_frame.columnconfigure(1, weight=1)

    def execute():
        region = region_entry.get()
        query = """
        UPDATE restaurant
        SET avgRating = LEAST(avgRating + 1, 5)
        WHERE address IN (
            SELECT address
            FROM addr_location al
            WHERE al.loc_Latitude IN (
                SELECT loc_Latitude FROM location WHERE region = %s
            )
            AND al.loc_Longitude IN (
                SELECT loc_Longitude FROM location WHERE region = %s
            )
        ) AND (avgRating * 1.1) < 5;
        """
        _, message = execute_query(query, (region, region))
        
        # Display Confirmation or Error
        for widget in results_frame.winfo_children():
            widget.destroy()

        if "successfully" in message:
            query_display = """
            SELECT restaurant_Name, avgRating FROM restaurant
            WHERE address IN (
                SELECT address FROM addr_location al
                WHERE al.loc_Latitude IN (
                    SELECT loc_Latitude FROM location WHERE region = %s
                )
                AND al.loc_Longitude IN (
                    SELECT loc_Longitude FROM location WHERE region = %s
                )
            );
            """
            columns, rows = execute_query(query_display, (region, region))
            if columns:
                display_results(results_frame, columns, rows)
        else:
            Label(results_frame, text=f"Error: {message}", font=("Arial", 12), bg="white", fg="red").pack()

    # "Run Update" Button
    Button(main_frame, text="Run Update", activebackground="orange", command=execute, font=("Arial", 12)).grid(row=2, column=0, columnspan=2, pady=10)

# Clear Frame
def clear_frame(frame):
    """
    Clears all widgets in a frame and resets the grid configuration.
    """
    for widget in frame.winfo_children():
        widget.destroy()

    # Reset grid configurations
    for i in range(20):  # Assuming a maximum of 20 rows
        frame.rowconfigure(i, weight=0)
    for i in range(5):  # Assuming a maximum of 5 columns
        frame.columnconfigure(i, weight=0)

# Main window setup
root = Tk()
root.title("Restaurant Startup Research Synthesizer")
root.geometry("1000x600")

# Frames
sidebar = Frame(root, width=400, bg="#f0f0f0")
sidebar.pack(side=LEFT, fill=Y)
main_frame = Frame(root, bg="white")
main_frame.pack(side=RIGHT, fill=BOTH, expand=True)

# Sidebar buttons
Label(sidebar, text="Queries", font=("Arial", 14, "bold"), bg="#f0f0f0").pack(pady=10)
Button(sidebar, text="Query 1", font=("Arial", 12), command=query1_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 2", font=("Arial", 12), command=query2_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 3", font=("Arial", 12), command=query3_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 4", font=("Arial", 12), command=query4_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 5", font=("Arial", 12), command=query5_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 6", font=("Arial", 12), command=query6_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 7", font=("Arial", 12), command=query7_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 8", font=("Arial", 12), command=query8_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 9", font=("Arial", 12), command=query9_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Query 10", font=("Arial", 12), command=query10_page).pack(fill=X, pady=5, padx=10)

Label(sidebar, text="Operations", font=("Arial", 14, "bold"), bg="#f0f0f0").pack(pady=10)
Button(sidebar, text="Insert", font=("Arial", 12), command=insert_page).pack(fill=X, pady=5, padx=10)
Button(sidebar, text="Update", font=("Arial", 12), command=update_page).pack(fill=X, pady=5, padx=10)

# Welcome page
def welcome_page():
    clear_frame(main_frame)
    Label(main_frame, text="Welcome To Restaurant Startup Research Synthesizer", font=("Arial", 20), bg="white").pack(pady=20)

welcome_page()

root.mainloop()