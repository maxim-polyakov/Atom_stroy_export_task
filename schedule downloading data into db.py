import psycopg2
from sqlalchemy import create_engine
import pandas as pd
import datetime as dt
import schedule


conn_remote = psycopg2.connect('postgresql://postgres:postgres@localhost:5432/postgres')
engine_remote = create_engine(f'postgresql://postgres:postgres@localhost:5432/postgres')

def insert_into_db():
    print("importing data to dab")
    df = pd.read_csv('Report.csv')
    df.to_sql("plan_fact_analysis", con=engine_remote, schema='public',
          index=False, if_exists='append')

schedule.every().day.do(insert_into_db)

if __name__ == "__main__":
#
#
    while True:
        schedule.run_pending()
