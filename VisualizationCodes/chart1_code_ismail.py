import mysql.connector
import matplotlib.pyplot as plt


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Ebru.miro.63",
  database="cs306_project"
)

mycursor = mydb.cursor()

query = """
SELECT year, COUNT(*)
FROM cigarette_advertisements c
WHERE c.ban_indicator = 5 OR c.ban_indicator = 4
GROUP BY year 
ORDER BY year ASC;
"""
mycursor.execute(query)
myresult = mycursor.fetchall()

x_axis = []
y_axis = []

for x in myresult:
  print(x[0], x[1])
  x_axis.append(x[0])
  y_axis.append(x[1])


plt.plot(x_axis, y_axis)
plt.title('title name')
plt.xlabel('year')
plt.ylabel('number of countries bans cigarette ads in very strict level')
plt.show()
