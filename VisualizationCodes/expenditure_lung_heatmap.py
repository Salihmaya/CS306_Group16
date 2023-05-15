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


import seaborn as sns
import matplotlib.pyplot as plt

# Create a pivot table with the counts of high expenditure years per country and year
heatmap_data = lung_expenditure_data.pivot_table(index='country_name', columns='year', aggfunc='size', fill_value=0)

# Create a heatmap
plt.figure(figsize=(16, 10))
sns.heatmap(heatmap_data, cmap='coolwarm', annot=True, fmt='d', cbar_kws={'label': 'Number of High Expenditure Years'})
plt.xlabel('Year')
plt.ylabel('Country')
plt.title('High Expenditure Years per Country and Year (Heatmap)')
plt.show()
