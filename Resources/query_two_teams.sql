select  year, win_loss, count(win_loss),
avg(win_loss_margin), avg(win_loss_margin_percent), venue
from afl_team_performance
where team = 'Adelaide' and opposing_team = 'North Melbourne' and year > 2017
group by year, win_loss, venue

Select * from afl_team_performance
where team = 'Adelaide' and opposing_team = 'North Melbourne'
and year = 2021
