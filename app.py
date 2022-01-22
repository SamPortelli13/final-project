from flask import Flask, render_template, redirect, jsonify

# import sqlalchemy
# from sqlalchemy.ext.automap import automap_base
# from sqlalchemy.orm import Session
# from sqlalchemy import create_engine, inspect, func
# import json
# from datetime import datetime
# from pathlib import Path
# import pandas as pd

# import time

  
# Database Setup
# connection_string = "postgres:Golfer7!@localhost:5432/afl_statistics_DB"
# engine = create_engine(f'postgresql://{connection_string}')

# reflect an existing database into a new model
# Base = automap_base()

# reflect the tables
# Base.prepare(engine, reflect=True)

# Save reference to the table
# afl_table = Base.classes.afl_team_performance

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
    # query = engine.execute('SELECT row_to_json(t) FROM (select team, gameid, year, round, team_score, team_points, opposing_team, opposing_team_score, win_loss, disposals, \
    #      kicks, marks, handballs, goals, behinds, hitouts, tackles, rebounds, inside50s, clearances, clangers, frees, frees_against, contested_possessions, \
    #          uncontested_possessions, contested_marks, marks_inside50, one_percenters, bounces, goal_assists from afl_team_performance) t').fetchall()
    # stats_list = []
    # for i in range (len(query)):
    #     stats_list.append(query[i])
    # return jsonify(stats_list)

if __name__ == "__main__":
    app.run(debug=True )