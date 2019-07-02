/* excel 数据导入 使用sql汇总取数据 */

proc import out=customer datafile="C:\Users\Administrator\Desktop\sas\data_project\customers.xlsx" dbms=xlsx;
sheet="customer";
getnames=yes;
run;

proc import out=product datafile="C:\Users\Administrator\Desktop\sas\data_project\products.xlsx" dbms=xlsx;
sheet="product";
getnames=yes;
run;

proc import out=return datafile="C:\Users\Administrator\Desktop\sas\data_project\returns.xlsx" dbms=xlsx;
sheet="Sheet1";
getnames=yes;
run;

proc import out=sale datafile="C:\Users\Administrator\Desktop\sas\data_project\sales.xlsx" dbms=xlsx;
sheet="cusproID";
getnames=yes;
run;


proc sql;
create table mg as 
select a.*, b.*, c.*
from sale as a 
left join customer as b
on a.customer_id=b.id
left join product as c 
on a.product_id=c.id
;quit;

proc print data=mg(obs=10);
run;
