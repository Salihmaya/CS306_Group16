import mysql.connector
import matplotlib.pyplot as plt
import pandas as pd

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Cs306",
  database="cs306"
)

mycursor = mydb.cursor()
query = """
SELECT c.country_name, AVG(l.male_death_rate) as avg_male, AVG(l.female_death_rate) as avg_female
FROM lung_cancer_deaths l
JOIN countries c ON l.iso_code = c.iso_code
GROUP BY c.country_name
ORDER BY (avg_male + avg_female) DESC
LIMIT 5;
"""
mycursor.execute(query)

# Fetch all the data from the query result
data = mycursor.fetchall()

# Get the column names from the cursor description
column_names = [desc[0] for desc in mycursor.description]

# Create a pandas dataframe from the data and column names
df = pd.DataFrame(data, columns=column_names)

# Create pie charts for each country
for index, row in df.iterrows():
    country_name = row['country_name']
    male_death_rate = row['avg_male']
    female_death_rate = row['avg_female']
    
    # Create a pie chart
    labels = ['Male Death Rate', 'Female Death Rate']
    sizes = [male_death_rate, female_death_rate]
    
    plt.figure(figsize=(6, 6))
    plt.pie(sizes, labels=labels, autopct='%1.1f%%', startangle=90)
    plt.title(f'{country_name}')
    plt.show()
