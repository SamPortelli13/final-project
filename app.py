from flask import Flask, render_template, redirect, jsonify

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, inspect, func
import json
# from datetime import datetime
# from pathlib import Path
import pandas as pd

# import time

  
# Database Setup
connection_string = "postgres:Golfer7!@localhost:5432/ufo_db"
engine = create_engine(f'postgresql://{connection_string}')

# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(engine, reflect=True)

# Save reference to the table
afl_table = Base.classes.all_countries_ufos

# Flask Routes
app = Flask(__name__)

@app.route("/")
def welcome():
    return render_template("index.html")

@app.route("/charts")
def compare():
    return render_template("charts.html")

@app.route("/model", methods=['GET', 'POST'])
def model():
    return render_template("model.html")

@app.route("/data")
def data():
    #query = engine.execute('SELECT row_to_json(t) FROM (select country, city, city_latitude, city_longitude, date, duration, state, shape, summary, time from all_countries_ufos) t LIMIT 10000').fetchall()
#    query = engine.execute('SELECT row_to_json(usa_ufo) FROM usa_ufo LIMIT 100').fetchall()
    #my_list = []

    #for i in range(len(query)):
    #    my_list.append(query[i][0])
    #print("my list:",jsonify(my_list))
    #return jsonify(my_list)

    df = pd.read_json('./Resources/model_export.json')
    data = df.to_dict('records')
    return jsonify(data)





if __name__ == "__main__":
    app.run(debug=True )