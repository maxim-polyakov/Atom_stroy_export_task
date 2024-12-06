CREATE OR REPLACE FUNCTION procc(a varchar, obj varchar)
RETURNS TABLE (Period timestamptz, Plan integer, Fact integer)
LANGUAGE sql AS
$$
   SELECT date_trunc(a, date_w) as Period, sum(plan) as plan, sum(fact) as Fact
   FROM public.plan_fact_analysis WHERE object = obj 
   GROUP BY date_trunc(a, date_w);
$$;

