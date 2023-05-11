import mysql.connector
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# establish a connection to the MySQL server
cnx = mysql.connector.connect(
  host="localhost",
    user="root",
    password="Bc.61942094342",
    database="cs306_project"
)

# create a cursor object to execute SQL queries
cursor = cnx.cursor()

# execute the SQL query to get the data
query = "SELECT country_name, year FROM low_death_rate_vs_high_lung_cancer_leftjoin"
cursor.execute(query)
data = cursor.fetchall()

# create a pandas DataFrame from the query result
df = pd.DataFrame(data, columns=["country_name", "year"])

# convert the "year" column to a numerical type
df["year"] = df["year"].astype(int)

# create a scatter plot using Seaborn
sns.set(style="darkgrid")
sns.scatterplot(x="year", y="country_name", data=df)

# display the chart
plt.xlabel("Year")
plt.ylabel("Country Name")
plt.title("Low Death Rates vs High Lung Cancer")
plt.show()

