import mysql.connector
import pandas as pd


config = {
    'user': 'root',
    'password': 'password',
    'host': 'localhost',
    'database': 'viz',
}

connection = mysql.connector.connect(**config)
cursor = connection.cursor()

query = "SELECT * FROM high_expenditure_high_lung"
cursor.execute(query)

data = cursor.fetchall()
column_names = [desc[0] for desc in cursor.description]
lung_expenditure_df = pd.DataFrame(data, columns=column_names)

cursor.close()
connection.close()


import numpy as np

# Create a pivot table with the counts of high expenditure years per country and year
stacked_bar_data = lung_expenditure_data.pivot_table(index='country_name', columns='year', aggfunc='size', fill_value=0)

# Calculate the proportion of high expenditure years for each country and year
stacked_bar_data = stacked_bar_data.div(stacked_bar_data.sum(axis=1), axis=0)

# Create a stacked barplot
fig, ax = plt.subplots(figsize=(14, 8))

# Plot the bars for each year, stacking them on top of each other
bottom = np.zeros(len(stacked_bar_data))
for column in stacked_bar_data.columns[::-1]:
    ax.bar(stacked_bar_data.index, stacked_bar_data[column], bottom=bottom, label=column)
    bottom += stacked_bar_data[column]

# Customize the plot
plt.xticks(rotation=90)
plt.xlabel('Country')
plt.ylabel('Proportion of High Expenditure Years')
plt.title('Proportion of High Expenditure Years per Country by Year (Stacked Barplot)')
plt.legend(title='Year', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.show()
