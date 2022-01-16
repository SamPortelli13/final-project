drop table afl_team_performance;

create table afl_team_performance as
select * from afl_combined_teams
order by team, date desc, gameid;

alter table afl_team_performance 
add Primary Key (team, gameid );