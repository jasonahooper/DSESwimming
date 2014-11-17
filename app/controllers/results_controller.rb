class ResultsController < ApplicationController
  def index
    sql = 'select region, sum(points) as points from (select * from (select *, row_number() over (partition by competitor order by points desc) as rownum from results) as det where rownum < 5) as tot group by region order by sum(points) desc'
    @team_points = ActiveRecord::Base.connection.execute(sql)
    sql = 'select * from (select *, row_number() over (partition by age_group, sex order by tot_points desc) as rank from (select competitor, age_group, sex, sum(points) as tot_points from results where competitor <> region group by competitor, age_group, sex) as det) as tot where rank < 4'
    @top_competitors = ActiveRecord::Base.connection.execute(sql)
  end
end
