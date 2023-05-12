import mysql.connector

# Connect to the MySQL database

cnx = mysql.connector.connect(
  host="localhost",
    user="root",
    password="Bc.61942094342",
    database="cs306_project"
)
import pandas as pd

# Retrieve the data from the MySQL database
query = "SELECT country_name, year, death_rate FROM death_rate_smoeking_new"
df = pd.read_sql(query, con=cnx)
import matplotlib.pyplot as plt

# Group the data by country name and plot a line chart for each country
for country_name, group in df.groupby('country_name'):
    plt.plot(group['year'], group['death_rate'], label=country_name)

plt.legend()
plt.xlabel('Year')
plt.ylabel('Death rate')
plt.title("Smoeking Death Rates for Countries")
plt.show()
