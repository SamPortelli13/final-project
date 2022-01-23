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
connection_string = "postgres:Golfer7!@localhost:5432/afl_statistics_DB"
engine = create_engine(f'postgresql://{connection_string}')

# reflect an existing database into a new model
Base = automap_base()

# reflect the tables
Base.prepare(engine, reflect=True)

# Save reference to the table
afl_table = Base.classes.model_export

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
    query = engine.execute('SELECT row_to_json(t) FROM (SELECT gameid, team, model_prob_1, model_prob_2, model_odds_1, model_odds_2, actual_winning_team, model_winning_team, team2, date, year, round, venue, starttime, win_loss, home_away, team_score, rainfall, team_points, opposing_team_score, win_loss_margin, win_loss_margin_percent, disposals, kicks, marks, handballs, goals, behinds, hitouts, tackles, rebounds, inside50s, clearances, clangers, frees, frees_against, contested_possessions, uncontested_possessions, contested_marks, marks_inside50, one_percenters, bounces, goal_assists from model_export ) t LIMIT 10000').fetchall()
#    query = engine.execute('SELECT row_to_json(usa_ufo) FROM usa_ufo LIMIT 100').fetchall()
    my_list = []

    for i in range(len(query)):
        my_list.append(query[i][0])
    #print("my list:",my_list)
    return jsonify(my_list)

    #df = pd.read_json('./Resources/model_export.json')
    #data = df.to_dict('records')
   # return jsonify(data)





if __name__ == "__main__":
    app.run(debug=True )