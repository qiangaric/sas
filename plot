

/* 画图 */
proc sgplot data=unemployment_sa;
    title 'European Unemployment';
    xaxis label = " ";
    yaxis label = "Unemployment Rate (%)";
    series x = date_var y = unemployment_rate / group=country_name;
run;
proc sgplot data=unemployment_sa
        (where=(country_name='Spain' or
                country_name='Portugal'));
    title 'Spanish and Portuguese Unemployment';
    xaxis label = " ";
    yaxis grid label = "Unemployment Rate (%)";
    series x = date_var y = unemployment_rate / group=country_name;
    keylegend / title="";
run;
