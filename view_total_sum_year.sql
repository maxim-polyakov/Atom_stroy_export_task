SELECT date_trunc('year', date_w) as Period, sum(plan) + sum(fact) as Summ FROM public.plan_fact_analysis where object = 'Объект1' GROUP BY date_trunc('year', date_w)