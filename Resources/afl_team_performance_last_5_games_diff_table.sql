drop table afl_team_performance_last_5_games_diff;

create table afl_team_performance_last_5_games_diff as
select a.team, a.team2, a.gameid, a.date, a.year, a.round, a.venue, a.starttime, a.home_away, 
a.team_score-b.team_score as team_score, 
a.rainfall,
a.team_points-b.team_points as team_points,
a.opposing_team_score-b.opposing_team_score as opposing_team_score,
a.win_loss_margin-b.win_loss_margin as win_loss_margin,
a.win_loss_margin_percent-b.win_loss_margin_percent as win_loss_margin_percent,
a.win_loss,
a.disposals-b.disposals as disposals,
a.kicks-b.kicks as kicks,
a.marks-b.marks as marks,
a.handballs-b.handballs as handballs,
a.goals-b.goals as goals,
a.behinds-b.behinds as behinds,
a.hitouts-b.hitouts as hitouts,
a.tackles-b.tackles as tackles,
a.rebounds-b.rebounds as rebounds,
a.inside50s-b.inside50s as inside50s,
a.clearances-b.clearances as clearances,
a.clangers-b.clangers as clangers,
a.frees-b.frees as frees,
a.frees_against-b.frees_against as frees_against,
a.contested_possessions-b.contested_possessions as contested_possessions,
a.uncontested_possessions-b.uncontested_possessions as uncontested_possessions,
a.contested_marks-b.contested_marks as contested_marks,
a.marks_inside50-b.marks_inside50 as marks_inside50,
a.one_percenters-b.one_percenters as one_percenters,
a.bounces-b.bounces as bounces,
a.goal_assists-b.goal_assists as goal_assists

from afl_team_performance_last_5_games a
left join afl_team_performance_last_5_games b on a.gameid=b.gameid and a.team != b.team
order by gameid;

alter table afl_team_performance_last_5_games_diff 
add Primary Key (team, gameid );

select * from afl_team_performance_last_5_games_diff where year = 2022 and team = 'Adelaide'