import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

config = {
    'user': '**',
    'password': '***',
    'host': '**',
    'database': '**',
}

connection = mysql.connector.connect(**config)
cursor = connection.cursor()
query = "SELECT * FROM high_quit_help_and_low_death_rate"
cursor.execute(query)

# Fetch the data and column names
data = cursor.fetchall()
column_names = [desc[0] for desc in cursor.description]

# Create a DataFrame from the fetched data
df = pd.DataFrame(data, columns=column_names)

cursor.close()
connection.close()


# Replace non-finite values with a default value or drop them
df['year'] = df['year'].replace([np.inf, -np.inf, np.nan], 0).astype(int)

# Remove rows with year 0
df = df[df['year'] != 0]

# Group the data by year and count the number of unique countries
countries_per_year = df.groupby('year')['country_name'].nunique()

# Set up the plot
fig, ax = plt.subplots(figsize=(10, 6))
countries_per_year.plot(kind='bar', ax=ax, color='steelblue')

# Set labels and title
ax.set_xlabel('Year')
ax.set_ylabel('Number of Countries')
plt.title('Number of Countries with Low Death Rate and High Quit Help')

plt.show()



