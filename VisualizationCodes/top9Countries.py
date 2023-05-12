import pandas as pd
import matplotlib.pyplot as plt
import mysql.connector

cnx = mysql.connector.connect(
  host="localhost",
    user="root",
    password="Bc.61942094342",
    database="cs306_project"
)

# Query data
query = '''SELECT c.country_name, d.year, d.death_rate
           FROM death_rate_smoking d
           JOIN countries c ON d.iso_code = c.iso_code
           ORDER BY c.country_name, d.year'''

df = pd.read_sql(query, con=cnx)

# Get the top 9 countries by death rate
top_countries = df.groupby('country_name').mean().sort_values(by='death_rate', ascending=False).head(9).index

# Create a subplot grid with 3x3 axes
fig, axs = plt.subplots(nrows=3, ncols=3, figsize=(15, 10))

# Plot a line chart for each country in a separate subplot
for i, country in enumerate(top_countries):
    row = i // 3
    col = i % 3
    df_country = df[df['country_name'] == country]
    axs[row, col].plot(df_country['year'], df_country['death_rate'], linewidth=2)
    axs[row, col].set_title(country)
    axs[row, col].set_xlabel('Year')
    axs[row, col].set_ylabel('Death rate')
    
# Adjust the spacing between subplots

fig.tight_layout()

# Show the plot
plt.show()


