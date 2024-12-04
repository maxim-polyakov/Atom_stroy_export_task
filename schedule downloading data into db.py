import psycopg2
from sqlalchemy import create_engine
import pandas as pd
import datetime as dt
import schedule


conn_remote = psycopg2.connect('postgres://postgres:gaTResKPJX25@ep-round-paper-091468.us-east-2.aws.neon.tech/BotsMemory')
engine_remote = create_engine(f'postgresql://postgres:gaTResKPJX25@ep-round-paper-091468.us-east-2.aws.neon.tech/BotsMemory')

def insert_into_db():
    print("importing data to dab")
    df = pd.read_csv('Report.csv')
    df.to_sql("План-факт анализ", con=engine_remote, schema='messtorage',
          index=False, if_exists='append')

schedule.every().day.do(insert_into_db)

if __name__ == "__main__":
#
#
    while True:
        schedule.run_pending()
