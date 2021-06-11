-- Student table ，id ，name
-- Grade table，category，student_id， score 


-- 1. 查询student表的2到4条记录
select * from Student limit 1, 3;


-- 找出数学成绩排名前十的学生的信息，展示姓名即可
select name from 