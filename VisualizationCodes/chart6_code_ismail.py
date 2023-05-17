
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
SELECT ctr.country_name, c.year, d.death_rate/c.ban_indicator AS success_rate
FROM cigarette_advertisements c, death_rate_smoking d, countries ctr
WHERE c.iso_code = d.iso_code AND c.year = d.year AND c.iso_code = ctr.iso_code 
AND c.iso_code IN ('AUT', 'BEL', 'BGR', 'CYP', 'CZE', 'DEU', 'DNK', 'EST', 'ESP', 'FIN', 'FRA', 'GRC', 'HRV', 'HUN', 'IRL', 'ITA', 'LTU', 'LVA', 'LUX', 'MLT', 'NLD', 'POL', 'PRT', 'ROU', 'SVK', 'SVN', 'SWE')
ORDER BY c.iso_code DESC
"""
mycursor.execute(query)
myresult = mycursor.fetchall()

country_name = []
year = []
success_rate = []

for x in myresult:
  country_name.append(x[0])
  year.append(int(x[1]))
  success_rate.append(x[2])


country_name_list = []
success_rate_list = []
year_list = []

p = 0
for i in range(len(year)):
  if i != 0:
    if(i%7 == 0) :
        year_list.append(year[p:i])
        country_name_list.append(country_name[p:i])
        success_rate_list.append(success_rate[p:i])
        p = i


unique_countries = []
for i in country_name_list:
   unique_countries.append(i[0])



data = {}
for i in range(len(unique_countries)):
   data[unique_countries[i]] = success_rate_list[i]


df = pd.DataFrame(data, index = [2018, 2016, 2014, 2012, 2010, 2008, 2007])

print(df)

df.plot.area(title = " death_rate/ban_indicator of EU Countries. \n This ratio shows success of ads policy, low ratio indicate greater success")
plt.show()  