drop table afl_team_performance_last_5_games;

create table afl_team_performance_last_5_games as
SELECT a.team, a.gameid, date, year, round, venue, starttime, 
home_away, avg(team_score) as team_score, avg(rainfall) as rainfall, avg(team_points) as team_points,  
avg(opposing_team_score) as opposing_team_score, avg(win_loss_margin) as win_loss_margin, avg(win_loss_margin_percent) as win_loss_margin_percent, 
avg(win_loss) as win_loss, avg(disposals) as disposals, avg(kicks) as kicks, avg(marks) as marks, avg(handballs) as handballs, avg(goals) as goals, 
avg(behinds) as behinds, avg(hitouts) as hitouts, avg(tackles) as tackles, avg(rebounds) as rebounds, avg(inside50s) as inside50s, avg(clearances) as clearances, 
avg(clangers) as clangers, avg(frees) as frees, avg(frees_against) as frees_against, avg(contested_possessions) as contested_possessions, avg(uncontested_possessions) as uncontested_possessions, 
avg(contested_marks) as contested_marks, avg(marks_inside50) as marks_inside50, avg(one_percenters) as one_percenters, avg(bounces) as bounces, avg(goal_assists) as goal_assists	

FROM afl_team_performance as a
inner join last_5_games_list as b on a.team = b.team and a.gameid=b.gameid
where a.date > '2012-04-22'
group by a.team, a.gameid, date, year, round, venue, starttime, home_away
order by a.team, a.gameid;

alter table afl_team_performance_last_5_games 
add Primary Key (team, gameid );

Select * from afl_team_performance_last_5_games
