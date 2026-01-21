select * from loan.finance_1_1 ;
select * from finance_1_1 ;
select count(*) from finance_1_1 ;
select * from finance_2 ;
select count(*) from finance_2 ;



#KPI 
#Year-wise Loan Amount Statistics
#Grade and Sub-grade Wise Revolving Balance
#Total Payment: Verified vs Non-Verified Status
#State-wise and Month-wise Loan Status
#Home Ownership vs Last Payment Date Statistics

        #KPI-1

select year(issue_d) as Year_of_issue_d , sum(loan_amnt) as Total_loan_amnt
from finance_1_1
group by Year_of_issue_d
order by Year_of_issue_d;

     #KPI-2
select
grade , sub_grade , sum(revol_bal) as total_revol_bal
from finance_1_1 inner join finance_2
on(finance_1_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade ;

             #KPI-3
select verification_status , sum(total_pymnt) as total_pymnt
from finance_1_1 inner join finance_2
on(finance_1_1.id = finance_2.id)
group by verification_status
order by verification_status ;

                     #KPI-3 (Clean Format show sign Dollar)
select verification_status , concat("$" , format (round(sum(total_pymnt)/1000000,2),2) , "M") as total_pymnt
from finance_1_1 inner join finance_2
on(finance_1_1.id = finance_2.id)
group by verification_status
order by verification_status ;

                                    #KPI-4 
select addr_state ,last_credit_pull_D , loan_status 
from finance_1_1 inner join finance_2
on(finance_1_1.id = finance_2.id)
group by addr_state , last_credit_pull_d , loan_status
order by last_credit_pull_d ;

                 # KPI-5
                 
select 
home_ownership , last_pymnt_d
from finance_1_1 inner join finance_2

on(finance_1_1.id = finance_2.id)
group by home_ownership , last_pymnt_d
order by home_ownership , last_pymnt_d ;
