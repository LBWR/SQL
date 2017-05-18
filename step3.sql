/*把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。*/
select name from peoples where name no in (select name from peoples where school='GDUFS')as T1 and school is null

/*3-2.查找计算机系每次考试学生的平均成绩(最终显示学生姓名, 考试名称, 平均分)。*/
select student_ID, dept_name, avg(grade)
from exam inner join student on exam.student_ID=student.ID
where dept_name='computer'
group by student_ID

/*3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）。*/
select name, avg(grade)
from student, exam
where sex='f'
group by name
having avg(grade)=80 or avg(grade)>80

/*3-4.找出人数最少的院系以及其年度预算。*/
select T2.dept_name, budget
from department inner join (select * from (select dept_name, count(ID) as st_nm from 
student group by dept_name) as T1 order by st_nm limit 1) as T2 on department.dept_name=T2.dept_name

/*计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。*/
update department set dept_name='comp. sci.' where dept_name='computer'

/*修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。*/

/*向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.*/
insert into department values('avg_budget',null, 21400)

/*删除计算机系中考试成绩平均分低于70的学生.*/
select student_ID,avg(grade) as avg_gra 
from exam inner join student on exam.student_ID=student.ID
where dept_name='computer'
group by student_ID
having avg_gra<70

delete *
from student
where ID=2 and ID=3

/*找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.*/
select student_ID, avg(grade) as avg_gra
from exam inner join student on exam.student_ID=student.ID
where emotion_state='loving'
group by student_ID
having avg_gra<75

update student set emotion_state='single' where ID=3 or ID=10






