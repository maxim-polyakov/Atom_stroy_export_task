SELECT date_trunc('month', date), sum(summ_plan) ,sum(summ_fact) FROM public.plan_fact_analysis where object = 1 GROUP BY date_trunc('month', date)