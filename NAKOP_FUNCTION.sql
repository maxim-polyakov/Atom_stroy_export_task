CREATE OR REPLACE FUNCTION nakoppp(a varchar, obj varchar)
RETURNS TABLE (Period timestamptz, Plan integer, Fact integer, PlanNakop integer, FactNakop integer)
LANGUAGE SQL AS
$$
   select distinct
   	date_trunc(a, date_w) as Period,
   	sum(plan) as Plan,
   	sum(fact) as Fact,
   	sum(plan) over (order by date_trunc(a, date_w)) as PlanKanop,
   	sum(fact) over (order by date_trunc(a, date_w)) as FactNakop
   FROM public.plan_fact_analysis WHERE object = obj 
   GROUP BY date_trunc(a, date_w), plan, fact;
$$;

