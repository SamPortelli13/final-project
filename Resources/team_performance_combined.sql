drop view afl_combined_teams;
create view afl_combined_teams as
select a.hometeam as team, a.gameid, a.date, a.year, a.round, a.venue, a.starttime, 1 as home_away, a.hometeam_score as team_score,rainfall, a.hometeam_points as team_points, 
	a.awayteam as opposing_team, a.awayteamscore as opposing_team_score, 
	case when a.hometeam=a.winningteam then a.winningmargin else a.winningmargin * -1 end as win_loss_margin,
	case when a.hometeam=a.winningteam then a.winningmargin_percent else a.winningmargin_percent * -1 end as win_loss_margin_percent,
	case when a.hometeam=a.winningteam then 1 else 0 end AS win_loss,
	sum(disposals) as disposals,
	sum(kicks) as kicks,
	sum(marks) as marks,
	sum(handballs) as handballs,
	sum(goals) as goals,
	sum(behinds) as behinds,
	sum(hitouts) as hitouts,
	sum(tackles) as tackles,
	sum(rebounds) as rebounds,
	sum(inside50s) as inside50s,
	sum(clearances) as clearances,
	sum(clangers) as clangers,
	sum(frees) as frees,
	sum(frees_against) as frees_against,
	sum(contested_possessions) as contested_possessions,
	sum(uncontested_possessions) as uncontested_possessions,
	sum(contested_marks) as contested_marks,
	sum(marks_inside50) as marks_inside50,
	sum(one_percenters) as one_percenters,
	sum(bounces) as bounces,
	sum(goal_assists) as goal_assists
	from games a
	left outer join stats as b on a.gameid = b.gameid
	where a.hometeam = b.team
group by a.hometeam, a.gameid, a.date, a.year, a.round, a.venue, a.starttime,  a.hometeam_score, a.hometeam_points , 
	a.awayteam , a.awayteamscore	
union
select a.awayteam as team, a.gameid, a.date, a.year, a.round, a.venue, a.starttime, 0 as home_away, a.awayteamscore as team_score,rainfall, a.awayteam_points as team_points, 
	a.hometeam as opposing_team, a.hometeam_score as opposing_team_score, 
	case when a.awayteam=a.winningteam then a.winningmargin else a.winningmargin * -1 end as win_loss_margin,
	case when a.awayteam=a.winningteam then a.winningmargin_percent else a.winningmargin_percent * -1 end as win_loss_margin_percent,
	case when a.awayteam=a.winningteam then 1 else 0 end AS win_loss,
	sum(disposals) as disposals,
	sum(kicks) as kicks,
	sum(marks) as marks,
	sum(handballs) as handballs,
	sum(goals) as goals,
	sum(behinds) as behinds,
	sum(hitouts) as hitouts,
	sum(tackles) as tackles,
	sum(rebounds) as rebounds,
	sum(inside50s) as inside50s,
	sum(clearances) as clearances,
	sum(clangers) as clangers,
	sum(frees) as frees,
	sum(frees_against) as frees_against,
	sum(contested_possessions) as contested_possessions,
	sum(uncontested_possessions) as uncontested_possessions,
	sum(contested_marks) as contested_marks,
	sum(marks_inside50) as marks_inside50,
	sum(one_percenters) as one_percenters,
	sum(bounces) as bounces,
	sum(goal_assists) as goal_assists
	from games a
	left outer join stats as b on a.gameid = b.gameid
	where a.awayteam = b.team
group by a.awayteam, a.gameid, a.date, a.year, a.round, a.venue, a.starttime,  a.awayteamscore, a.awayteam_points , 
	a.hometeam , a.hometeam_score	

	