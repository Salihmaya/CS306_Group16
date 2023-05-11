import mysql.connector
import matplotlib.pyplot as plt
import numpy as np


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Ebru.miro.63",
  database="cs306_project"
)

mycursor = mydb.cursor()

query = """
SELECT ctr.country_name, AVG(ban_indicator) AS avg_ban_indicator, AVG(death_rate) AS avg_death_rate, count(c.year)
FROM cigarette_advertisements c, death_rate_smoking d, countries ctr
WHERE c.iso_code = d.iso_code AND c.year = d.year AND c.iso_code = ctr.iso_code
group by c.iso_code
Having AVG(c.ban_indicator) >= 4.5
ORDER BY AVG(death_rate) DESC
LIMIT 10;
"""
mycursor.execute(query)
myresult = mycursor.fetchall()

country_name = []
avg_ban_indicator = []
avg_death_rate = []

for x in myresult:
  country_name.append(x[0])
  avg_ban_indicator.append(int(x[1]))
  avg_death_rate.append(x[2])

#y_pos = np.arange(len(country_name))

country_name = np.array(country_name)
avg_death_rate = np.array(avg_death_rate)


plt.barh(country_name, avg_death_rate)
plt.title("top 10 countries with the lowest death rates with a loose ban policy")
plt.xlabel("Average death rate")
plt.show()
