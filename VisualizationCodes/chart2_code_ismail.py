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
SELECT c.iso_code, AVG(ban_indicator) AS avg_ban_indicator, AVG(death_rate) AS avg_death_rate, count(c.year)
FROM cigarette_advertisements c, death_rate_smoking d
WHERE c.iso_code = d.iso_code AND c.year = d.year
group by c.iso_code
LIMIT 40;
"""
mycursor.execute(query)
myresult = mycursor.fetchall()

iso_code = []
avg_ban_indicator = []
avg_death_rate = []

for x in myresult:
  print(x[0], x[1], x[2])
  iso_code.append(x[0])
  avg_ban_indicator.append(x[1])
  avg_death_rate.append(x[2])


for i, iso_code in enumerate(iso_code):
    plt.annotate(iso_code, (avg_ban_indicator[i], avg_death_rate[i]))


plt.scatter(avg_ban_indicator, avg_death_rate)
plt.title("values are average of 2007 - 2018")
plt.xlabel('average ban indicator')
plt.ylabel('average death rate')
plt.show()

