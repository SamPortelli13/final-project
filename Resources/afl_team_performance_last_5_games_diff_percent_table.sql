drop table afl_team_performance_last_5_games_diff_percent;

create table afl_team_performance_last_5_games_diff_percent as
select a.team, a.team2, a.gameid, a.date, a.year, a.round, a.venue, a.starttime, a.home_away, 
(a.team_score-b.team_score)/(a.team_score+b.team_score+0.01)*100 as team_score, 
a.rainfall,
(a.team_points-b.team_points)/ (a.team_points+b.team_points+0.01) * 100 as team_points,
(a.opposing_team_score-b.opposing_team_score) / (a.opposing_team_score+b.opposing_team_score+0.01)*100 as opposing_team_score,
(a.win_loss_margin-b.win_loss_margin)/(a.win_loss_margin+b.win_loss_margin+0.01)/100 as win_loss_margin,
(a.win_loss_margin_percent-b.win_loss_margin_percent)/ (a.win_loss_margin_percent-b.win_loss_margin_percent+0.01)* 100 as win_loss_margin_percent,
a.win_loss,
(a.disposals-b.disposals) / (a.disposals+b.disposals+0.01) * 100 as disposals,
(a.kicks-b.kicks) / (a.kicks+b.kicks+0.01) * 100 as kicks,
(a.marks-b.marks) / (a.marks+b.marks+0.01) * 100 as marks,
(a.handballs-b.handballs) / (a.handballs+b.handballs+0.01) * 100 as handballs,
(a.goals-b.goals) / (a.goals+b.goals+0.01) * 100 as goals,
(a.behinds-b.behinds) / (a.behinds+b.behinds+0.01) * 100 as behinds,
(a.hitouts-b.hitouts) / (a.hitouts+b.hitouts+0.01) * 100  as hitouts,
(a.tackles-b.tackles) / (a.tackles+b.tackles+0.01) * 100 as tackles,
(a.rebounds-b.rebounds) / (a.rebounds+b.rebounds+0.01)* 100 as rebounds,
(a.inside50s-b.inside50s) / (a.inside50s+b.inside50s+0.01) * 100 as inside50s,
(a.clearances-b.clearances) / (a.clearances+b.clearances+0.01) * 100 as clearances,
(a.clangers-b.clangers) / (a.clangers+b.clangers+0.01) * 100 as clangers,
(a.frees-b.frees) / (a.frees+b.frees+0.01) * 100  as frees,
(a.frees_against-b.frees_against) / (a.frees_against+b.frees_against+0.01) * 100 as frees_against,
(a.contested_possessions-b.contested_possessions) / (a.contested_possessions+b.contested_possessions+0.01) * 100 as contested_possessions,
(a.uncontested_possessions-b.uncontested_possessions) / (a.uncontested_possessions+b.uncontested_possessions+0.01) * 100 as uncontested_possessions,
(a.contested_marks-b.contested_marks) / (a.contested_marks+b.contested_marks+0.01) * 100 as contested_marks,
(a.marks_inside50-b.marks_inside50) / (a.marks_inside50+b.marks_inside50+0.01) * 100 as marks_inside50,
(a.one_percenters-b.one_percenters) / (a.one_percenters+b.one_percenters+0.01) * 100 as one_percenters,
(a.bounces-b.bounces) / (a.bounces+b.bounces+0.01) * 100 as bounces,
(a.goal_assists-b.goal_assists) / (a.goal_assists+b.goal_assists+0.01) * 100 as goal_assists

from afl_team_performance_last_5_games a
left join afl_team_performance_last_5_games b on a.gameid=b.gameid and a.team != b.team
order by gameid;

alter table afl_team_performance_last_5_games_diff_percent 
add Primary Key (team, gameid );

select * from afl_team_performance_last_5_games_diff_percent where year = 2022 and team = 'Adelaide'