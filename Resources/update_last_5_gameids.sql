update team_gameid_lookup as a
set gameid_last_1 = ( SELECT max(b.gameid_seq) AS gameid_seq
   FROM team_gameid_lookup as b
	where a.gameid_seq > b.gameid_seq
	and a.team = b.team
  GROUP BY b.team
  ORDER BY b.team);

update team_gameid_lookup as a
set gameid_last_2 = ( SELECT max(b.gameid_seq) AS gameid_seq
   FROM team_gameid_lookup as b
	where a.gameid_last_1 > b.gameid_seq
	and a.team = b.team
  GROUP BY b.team
  ORDER BY b.team);
  
update team_gameid_lookup as a
set gameid_last_3 = ( SELECT max(b.gameid_seq) AS gameid_seq
   FROM team_gameid_lookup as b
	where a.gameid_last_2 > b.gameid_seq
	and a.team = b.team
  GROUP BY b.team
  ORDER BY b.team);
  
update team_gameid_lookup as a
set gameid_last_4 = ( SELECT max(b.gameid_seq) AS gameid_seq
   FROM team_gameid_lookup as b
	where a.gameid_last_3 > b.gameid_seq
	and a.team = b.team
  GROUP BY b.team
  ORDER BY b.team);
  
 update team_gameid_lookup as a
set gameid_last_5 = ( SELECT max(b.gameid_seq) AS gameid_seq
   FROM team_gameid_lookup as b
	where a.gameid_last_4 > b.gameid_seq
	and a.team = b.team
  GROUP BY b.team
  ORDER BY b.team);


select * from team_gameid_lookup
order by team, gameid_seq desc