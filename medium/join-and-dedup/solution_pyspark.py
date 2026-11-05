# Join and Dedup (Medium) · PySpark
# https://leetdata.ai/problems/join-and-dedup
# Accepted on leetdata.ai · 2026-07-31

# session: DuckDBSession (SQLFrame-compatible)
# F: pyspark.sql.functions
# Assign your result to 'result' (a DataFrame)
# Note: .collect() and .toPandas() are blocked
from pyspark.sql.window import Window


users = session.table("users")
logins = session.table("logins")

window_fn = Window.partitionBy("user_id").orderBy(F.desc("login_time"))

df = logins.withColumn("rn", F.rank().over(window_fn))
dff = df.filter(F.col("rn") == 1).select(F.col("login_id"), F.col("user_id"), F.col("login_time").alias("last_login_time"), F.col("ip_address"))


df_interm = users.join(dff, how="right", on=F.col("user_id"))

result =df_interm
# result = df_interm.withColumnRenamed("login_time", "last_login_time").select(F.col("users.user_id"), F.col("users.username"), F.col("users.email"), F.col("dff.last_login_time"), F.col("dff.ip_address"))
