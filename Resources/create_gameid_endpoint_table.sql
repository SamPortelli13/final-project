

drop table last_gameid_endpoint;
create table last_gameid_endpoint (gameid_seq integer);

insert into
	last_gameid_endpoint(gameid_seq)
	values (20211001);
	
select * from last_gameid_endpoint
