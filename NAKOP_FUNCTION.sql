CREATE OR REPLACE FUNCTION Nakopp(d integer, typeofwork varchar, mon integer, obj varchar)
RETURNS TABLE (Period integer, Plan integer, Fact integer, PlanNakop integer, FactNakop integer)
LANGUAGE SQL AS
$$
   SELECT
   EXTRACT(YEAR FROM date_w),
   sum(plan) as Plan,
   sum(fact) as Fact,
   sum(plan) over (order by date_w) as PlanKanop,
   sum(fact) over (order by date_w) as FactNakop
   FROM public.plan_fact_analysis
   WHERE object = obj and
   		 EXTRACT(YEAR FROM date_w) = d and
   		 EXTRACT(MONTH FROM date_w) = mon and
   		 work = typeofwork
   GROUP BY date_w, plan, fact;
$$;