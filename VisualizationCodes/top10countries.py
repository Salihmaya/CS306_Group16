import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt

# Create a MySQL connection
cnx = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Bc.61942094342",
    database="cs306_project")


# Retrieve the data from the MySQL database
query = "SELECT country_name, year, death_rate FROM death_rate_smoeking_new"
df = pd.read_sql(query, con=cnx)

# Compute the average death rate for each country
avg_death_rates = df.groupby('country_name').mean()

# Sort the countries by average death rate and select the top 10
top_10_countries = avg_death_rates.sort_values('death_rate', ascending=False).head(10)

# Create a line graph for each of the top 10 countries' death rates over time
for country in top_10_countries.index:
    df_country = df[df['country_name'] == country]
    plt.plot(df_country['year'], df_country['death_rate'], label=country, linewidth=2)

plt.xlabel('Year')
plt.ylabel('Death rate')
plt.title("Smoeking Death Rates for Top 10 Countries")
plt.legend()
plt.show()

