create database market;
select * from Market;
-- States with Most Number of jobs:
select count(Job_Title) as Count,Job_Location from Market group by Job_Location order by count(Job_Title) desc limit 10;

-- Average  Minimal and Maximum Salary in different States:
select avg(Lower_Salary) as Avg_Min_Salary,avg(Upper_Salary) as Avg_Max_Salary, Job_Location from Market group by Job_Location;

-- Average Salary in Different States
select Avg_SalaryK as Average_Salary, Job_Location from Market;

-- Top 10 Industries with maximum number of data science related Job Postings:
select count(Job_Title) from Market where Job_Title="Data Scientist";
select count(Job_Title),Industry from Market where Job_Title="Data Scientist" group by Industry order by count(Job_Title) desc limit 10;

-- Companies with maximum number of job openings:
select count(Job_Title),Company_Name from Market group by Company_Name order by count(Job_Title) desc limit 10;

--  Job Titles with Most Number of Jobs:
select count(Job_Title) from Market;
select count(Job_Title),Job_Title from Market group by Job_Title order by count(Job_Title) desc limit 10;

-- Relation between Education and Salary:
select avg(Avg_SalaryK) as Average_Salary,Degree as Education from Market group by Degree order by avg(Avg_SalaryK) desc;
