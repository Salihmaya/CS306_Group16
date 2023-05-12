import mysql.connector
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Cs306",
  database="cs306"
)

mycursor = mydb.cursor()

query = """
SELECT ctr.country_name, AVG(c.ban_indicator) AS avg_ban_indicator, AVG(d.male_death_rate) AS avg_male_death_rate, AVG(d.female_death_rate) AS avg_female_death_rate, count(c.year)
FROM cigarette_advertisements c, lung_cancer_deaths d, countries ctr
WHERE c.iso_code = d.iso_code AND c.year = d.year AND c.iso_code = ctr.iso_code
group by c.iso_code
Having AVG(c.ban_indicator) >= 4.5
ORDER BY AVG(male_death_rate)+AVG(female_death_rate) ASC
LIMIT 10;
"""

mycursor.execute(query)

data = mycursor.fetchall()

# Get the column names from the cursor description
column_names = [desc[0] for desc in mycursor.description]

# Create a pandas dataframe from the data and column names
df = pd.DataFrame(data, columns=column_names)

# Generate evenly spaced y-axis positions for each bar
y_pos = np.arange(len(df['country_name']))

plt.figure(figsize=(10, 6))
plt.barh(y_pos, df['avg_male_death_rate'], label='Male Death Rate')
plt.barh(y_pos, df['avg_female_death_rate'], label='Female Death Rate')

plt.yticks(y_pos, df['country_name'])  # Set country names as y-axis labels
plt.xlabel('Death Rate')
plt.ylabel('Country Name')
plt.title('Average Lung Cancer Death Rates of Countries with Strict Advertisement Ban Policy')
plt.legend()

plt.show()


