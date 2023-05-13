import mysql.connector
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="cs306_project"
)

mycursor = mydb.cursor()

query = """

SELECT ctr.country_name, c.year, c.ban_indicator
FROM cigarette_advertisements c, death_rate_smoking d, countries ctr
WHERE c.iso_code = d.iso_code AND c.year = d.year AND c.iso_code = ctr.iso_code 
AND c.iso_code IN ('AUT', 'BEL', 'BGR', 'CYP', 'CZE', 'DEU', 'DNK', 'EST', 'ESP', 'FIN', 'FRA', 'GRC', 'HRV', 'HUN', 'IRL', 'ITA', 'LTU', 'LVA', 'LUX', 'MLT', 'NLD', 'POL', 'PRT', 'ROU', 'SVK', 'SVN', 'SWE')
ORDER BY c.iso_code DESC
"""
mycursor.execute(query)
myresult = mycursor.fetchall()

country_name = []
year = []
ban_indicator = []

for x in myresult:
  country_name.append(x[0])
  year.append(int(x[1]))
  ban_indicator.append(x[2])



df = pd.DataFrame({
"country":country_name,
"years":year,
"value":ban_indicator
})

print(df)

 
# Create a grid : initialize it
g = sns.FacetGrid(df, col='country', hue='country', col_wrap=4, )

# Add the line over the area with the plot function
g = g.map(plt.plot, 'years', 'value')
 
# Fill the area with fill_between
g = g.map(plt.fill_between, 'years', 'value', alpha=0.2).set_titles("{col_name} country")
 
# Control the title of each facet
g = g.set_titles("{col_name}")
 
# Add a title for the whole plot
plt.subplots_adjust(top=0.92)
g = g.fig.suptitle('Evolution of level of cigarette ads bans in EU Countries')

# Show the graph
plt.show()
