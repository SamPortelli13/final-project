select hometeam as team, gameid, date, venue, starttime, attendance, 'Home' as home_away, hometeam_score as team_score,rainfall, hometeam_points as team_points, 
	awayteam as opposing_team, awayteamscore as opposing_team_score, 
	case when hometeam=winningteam then winningmargin else winningmargin * -1 end as win_loss_margin,
	case when hometeam=winningteam then winningmargin_percent else winningmargin_percent * -1 end as win_loss_margin_percent,
	case when hometeam=winningteam then 'win' else 'loss' end AS win_loss 
	from games
union
select awayteam as team, gameid, date, venue, starttime, attendance, 'Away' as home_away, awayteamscore as team_score,rainfall, awayteam_points as team_points, 
	hometeam as opposing_team, hometeam_score as opposing_team_score, 
	case when awayteam=winningteam then winningmargin else winningmargin * -1 end as win_loss_margin,
	case when awayteam=winningteam then winningmargin_percent else winningmargin_percent * -1 end as win_loss_margin_percent,
	case when awayteam=winningteam then 'win' else 'loss' end AS win_loss 
	from games