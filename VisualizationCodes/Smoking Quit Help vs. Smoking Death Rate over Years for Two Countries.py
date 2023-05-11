import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt


config = {
    'user': '**',
    'password': '**',
    'host': '**',
    'database': '**',
}


connection = mysql.connector.connect(**config)
cursor = connection.cursor()


quit_help_query = "SELECT * FROM smoking_quit_help WHERE iso_code IN ('TUR', 'USA')"
death_rate_query = "SELECT * FROM death_rate_smoking WHERE iso_code IN ('TUR', 'USA')"
quit_help_data = pd.read_sql(quit_help_query, connection)
death_rate_data = pd.read_sql(death_rate_query, connection)

# Merge the quit help and death rate data on 'year' and 'iso_code'
data = pd.merge(quit_help_data, death_rate_data, on=['year', 'iso_code'])

# the necessary columns for visualization
years = data['year']
help_indicator = data['help_indicator']
death_rate = data['death_rate']
country_codes = data['iso_code'].unique()

# Set up the plot with 2 subplots
fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(12, 6))
axes = axes.flatten()


for i, country_code in enumerate(country_codes[:2]):  # Select the first two country codes
    country_data = data[data['iso_code'] == country_code]

    # Extract the necessary columns for visualization
    years = country_data['year']
    help_indicator = country_data['help_indicator']
    death_rate = country_data['death_rate']

    # Create a new plot on the current subplot
    ax = axes[i]
    ax.plot(years, help_indicator, color='blue', label='Help Indicator')
    ax.set_xlabel('Year')
    ax.set_ylabel('Help Indicator', color='blue')
    ax.tick_params(axis='y', labelcolor='blue')

    # Create a twin y-axis for the death rate and plot it
    ax2 = ax.twinx()
    ax2.plot(years, death_rate, color='red', label='Death Rate')
    ax2.set_ylabel('Death Rate', color='red')
    ax2.tick_params(axis='y', labelcolor='red')

    # Set the title and legend for the subplot
    ax.set_title(country_code)
    ax.legend(loc='upper left')
    ax2.legend(loc='upper right')

# Graph adjustments
fig.suptitle('Smoking Quit Help vs. Smoking Death Rate over Years for Two Countries')
plt.tight_layout()
plt.show()
