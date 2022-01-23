-- Table: public.afl_team_performance_last_5_games

DROP TABLE model_export;

CREATE TABLE model_export
(
    gameid varchar NOT NULL,
	team varchar NOT NULL,
	model_prob_1 double precision,
	model_prob_2 double precision,
	model_odds_1 double precision,
	model_odds_2 double precision,
	Actual_winning_team varchar,
	Model_winning_team varchar NOT NULL,
    team2 varchar NOT NULL,
    date date,
    year integer,
    round varchar NOT NULL,
    venue varchar NOT NULL,
    starttime time without time zone,
    win_loss integer,
    home_away integer,
    team_score numeric,
    rainfall double precision,
    team_points bigint,
    opposing_team_score numeric,
    win_loss_margin numeric,
    win_loss_margin_percent double precision,
    disposals numeric,
    kicks numeric,
    marks numeric,
    handballs numeric,
    goals numeric,
    behinds numeric,
    hitouts numeric,
    tackles numeric,
    rebounds numeric,
    inside50s numeric,
    clearances numeric,
    clangers numeric,
    frees numeric,
    frees_against numeric,
    contested_possessions numeric,
    uncontested_possessions numeric,
    contested_marks numeric,
    marks_inside50 numeric,
    one_percenters numeric,
    bounces numeric,
    goal_assists numeric
);

alter table  model_export add   CONSTRAINT "pk_model" PRIMARY KEY (
        "gameid","team");

ALTER TABLE public.model_export
    OWNER to postgres;