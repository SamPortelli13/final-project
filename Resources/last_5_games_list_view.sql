create view last_5_games_list as
Select a.team, a.gameid, b.gameid as gameid_last from team_gameid_lookup a
left join team_gameid_lookup as b on a.team = b.team and a.gameid_last_1=b.gameid_seq
union
Select a.team, a.gameid, b.gameid as gameid_last from team_gameid_lookup a
left join team_gameid_lookup as b on a.team = b.team and a.gameid_last_2=b.gameid_seq
union
Select a.team, a.gameid, b.gameid as gameid_last from team_gameid_lookup a
left join team_gameid_lookup as b on a.team = b.team and a.gameid_last_3=b.gameid_seq
union
Select a.team, a.gameid, b.gameid as gameid_last from team_gameid_lookup a
left join team_gameid_lookup as b on a.team = b.team and a.gameid_last_4=b.gameid_seq
union
Select a.team, a.gameid, b.gameid as gameid_last from team_gameid_lookup a
left join team_gameid_lookup as b on a.team = b.team and a.gameid_last_5=b.gameid_seq




select * from last_5_games_list
order by team, gameid, gameid_last

