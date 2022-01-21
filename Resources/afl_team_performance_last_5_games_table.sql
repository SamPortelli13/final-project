drop table afl_team_performance_last_5_games;

create table afl_team_performance_last_5_games as
SELECT a.team as team, a.opposing_team as team2, a.gameid, a.date, a.year, a.round, a.venue, a.starttime, a.win_loss, 
a.home_away, avg(c.team_score) as team_score, avg(c.rainfall) as rainfall, sum(c.team_points) as team_points,  
avg(c.opposing_team_score) as opposing_team_score, avg(c.win_loss_margin) as win_loss_margin, avg(c.win_loss_margin_percent) as win_loss_margin_percent, 
avg(c.disposals) as disposals, avg(c.kicks) as kicks, avg(c.marks) as marks, avg(c.handballs) as handballs, avg(c.goals) as goals, 
avg(c.behinds) as behinds, avg(c.hitouts) as hitouts, avg(c.tackles) as tackles, avg(c.rebounds) as rebounds, avg(c.inside50s) as inside50s, avg(c.clearances) as clearances, 
avg(c.clangers) as clangers, avg(c.frees) as frees, avg(c.frees_against) as frees_against, avg(c.contested_possessions) as contested_possessions, avg(c.uncontested_possessions) as uncontested_possessions, 
avg(c.contested_marks) as contested_marks, avg(c.marks_inside50) as marks_inside50, avg(c.one_percenters) as one_percenters, avg(c.bounces) as bounces, avg(c.goal_assists) as goal_assists	
FROM afl_team_performance as a
inner join last_5_games_list as b on a.team = b.team and a.gameid=b.gameid
inner join afl_team_performance as c on b.team = c.team and c.gameid=b.gameid_last
where a.date > '2012-04-22'
group by a.team, a.gameid, a.date, a.year, a.round, a.venue, a.starttime, a.home_away, a.win_loss
order by a.team, a.gameid desc;

alter table afl_team_performance_last_5_games 
add Primary Key (team, gameid );

Select * from afl_team_performance_last_5_games where gameid like '2022%' and team='Adelaide';
select * from last_5_games_list where team = 'Adelaide' and gameid like '2022%'