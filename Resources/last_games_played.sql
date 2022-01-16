select 
team, gameid_seq from team_gameid_lookup as a
where gameid_seq not in (select max from  last_game_played as b
					where a.team=b.team )
and gameid_seq > 20212300
group by team, gameid_seq
order by team, gameid_seq desc

drop view last_game_played;
create view last_game_played as
select team, max(gameid_seq)as gameid_seq from  team_gameid_lookup
group by team
order by team

drop view last_game_played_1;
create view last_game_played_1 as
select team, max(gameid_seq) as gameid_seq from  team_gameid_lookup
where gameid_seq not in (select gameid_seq from last_game_played)
group by team
order by team

select * from last_game_played
select * from last_game_played_1
select * from last_game_played_2
select * from last_game_played_3
select * from last_game_played_4
select * from last_game_played_5

drop view last_game_played_2;
create view last_game_played_2 as
select team, max(gameid_seq) as gameid_seq from  team_gameid_lookup as a
where (a.gameid_seq not in (select b.gameid_seq from last_game_played as b)
and a.gameid_seq not in (select c.gameid_seq from last_game_played_1 as c) )
group by team
order by team

drop view last_game_played_3;
create view last_game_played_3 as
select team, max(gameid_seq) as gameid_seq from  team_gameid_lookup as a
where (a.gameid_seq not in (select gameid_seq from last_game_played)
		and a.gameid_seq not in (select gameid_seq from last_game_played_1)
	  and a.gameid_seq not in (select gameid_seq from last_game_played_2))
group by team
order by team

drop view last_game_played_4;
create view last_game_played_4 as
select team, max(gameid_seq) as gameid_seq from  team_gameid_lookup as a
where (a.gameid_seq not in (select gameid_seq from last_game_played)
		and a.gameid_seq not in (select gameid_seq from last_game_played_1)
	  and a.gameid_seq not in (select gameid_seq from last_game_played_2)
	  and a.gameid_seq not in (select gameid_seq from last_game_played_3))
group by team
order by team

drop view last_game_played_5;
create view last_game_played_5 as
select team, max(gameid_seq) as gameid_seq from  team_gameid_lookup as a
where (a.gameid_seq not in (select gameid_seq from last_game_played)
		and a.gameid_seq not in (select gameid_seq from last_game_played_1)
	  and a.gameid_seq not in (select gameid_seq from last_game_played_2)
	  and a.gameid_seq not in (select gameid_seq from last_game_played_3)
	  and a.gameid_seq not in (select gameid_seq from last_game_played_4))
group by team
order by team

