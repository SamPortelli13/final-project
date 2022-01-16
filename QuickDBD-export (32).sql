-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "games" (
    "gameid" varchar   NOT NULL,
    "year" integer   NOT NULL,
    "round" varchar   NOT NULL,
    "date" date   NOT NULL,
    "venue" varchar   NOT NULL,
    "starttime" time   NOT NULL,
    "attendance" integer   NOT NULL,
    "hometeam" varchar   NOT NULL,
    "hometeam_score" integer   NOT NULL,
    "awayteam" varchar   NOT NULL,
    "awayteamscore" integer   NOT NULL,
    "rainfall" float   NOT NULL,
    "winningteam" varchar   NOT NULL,
    "winningmargin" integer   NOT NULL,
    "winningmargin_percent" float   NOT NULL,
    "hometeam_points" integer   NOT NULL,
    "awayteam_points" integer   NOT NULL,
    CONSTRAINT "pk_games" PRIMARY KEY (
        "gameid"
     )
);

CREATE TABLE "players" (
    "playerid" varchar   NOT NULL,
    "playername" varchar   NOT NULL,
    "height" integer   NOT NULL,
    "weight" integer   NOT NULL,
    "dateofbirth" date   NOT NULL,
    "position" varchar   NOT NULL,
    "origin" varchar   NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "playerid"
     )
);

CREATE TABLE "stats" (
    "gameid" varchar   NOT NULL,
    "team" varchar   NOT NULL,
    "year" integer   NOT NULL,
    "round" varchar   NOT NULL,
    "playerid" varchar   NOT NULL,
    "playername" varchar   NOT NULL,
    "gamenumber" integer   NOT NULL,
    "disposals" integer   NOT NULL,
    "kicks" integer   NOT NULL,
    "marks" integer   NOT NULL,
    "handballs" integer   NOT NULL,
    "goals" integer   NOT NULL,
    "behinds" integer   NOT NULL,
    "hitouts" integer   NOT NULL,
    "tackles" integer   NOT NULL,
    "rebounds" integer   NOT NULL,
    "inside50s" integer   NOT NULL,
    "clearances" integer   NOT NULL,
    "clangers" integer   NOT NULL,
    "frees" integer   NOT NULL,
    "frees_against" integer   NOT NULL,
    "brownlow_votes" integer   NOT NULL,
    "contested_possessions" integer   NOT NULL,
    "uncontested_possessions" integer   NOT NULL,
    "contested_marks" integer   NOT NULL,
    "marks_inside50" integer   NOT NULL,
    "one_percenters" integer   NOT NULL,
    "bounces" integer   NOT NULL,
    "goal_assists" integer   NOT NULL,
    "percent_played" float   NOT NULL,
    "subs" varchar   NOT NULL,
    CONSTRAINT "pk_stats" PRIMARY KEY (
        "gameid","playerid"
     )
);

ALTER TABLE "stats" ADD CONSTRAINT "fk_stats_gameid" FOREIGN KEY("gameid")
REFERENCES "games" ("gameid");

ALTER TABLE "stats" ADD CONSTRAINT "fk_stats_playerid" FOREIGN KEY("playerid")
REFERENCES "players" ("playerid");

