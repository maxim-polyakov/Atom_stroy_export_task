CREATE OR REPLACE FUNCTION Nakopp(yr integer, mon integer, obj varchar, typeofwork varchar)
RETURNS TABLE (Period timestamptz, Plann  bigint, Factt  bigint, PlanNakop  bigint, FactNakop  bigint, year  numeric, month  numeric, day  numeric)
LANGUAGE plpgsql AS
$$
BEGIN
	if mon is not null then
		if yr is not null then 	
			IF typeofwork is not null and obj is not null then
				RETURN QUERY
				SELECT
   				date_trunc('year', date_w) as Period,
   				sum(plan) as Plann,
   				sum(fact) as Factt,
   				sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   				sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   				EXTRACT(YEAR FROM date_w) as year,
   				EXTRACT(MONTH FROM date_w) as month,
   				EXTRACT(DAY FROM date_w) as day
   				FROM public.plan_fact_analysis
    			WHERE object = obj and
   				  	  work = typeofwork and 
   				  	  EXTRACT(YEAR FROM date_w) = yr and
   				  	  EXTRACT(MONTH FROM date_w) = mon
    			GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    		else
    			if typeofwork is null and obj is not null then
    				RETURN QUERY
    				SELECT
   					date_trunc('year', date_w) as Period,
   					sum(plan) as Plann,
   					sum(fact) as Factt,
   					sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   					sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   					EXTRACT(YEAR FROM date_w) as year,
   					EXTRACT(MONTH FROM date_w) as month,
   					EXTRACT(DAY FROM date_w) as day
   					FROM public.plan_fact_analysis
    				WHERE object = obj and 
    				  	  EXTRACT(YEAR FROM date_w) = yr and
    				  	  EXTRACT(MONTH FROM date_w) = mon
    				GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    			else
    				if typeofwork is null and obj is null then
    					RETURN QUERY
    					SELECT
   						date_trunc('year', date_w) as Period,
   						sum(plan) as Plann,
   						sum(fact) as Factt,
   						sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   						sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   						EXTRACT(YEAR FROM date_w) as yr,
   						EXTRACT(MONTH FROM date_w) as mont,
   						EXTRACT(DAY FROM date_w) as dayy
   						FROM public.plan_fact_analysis
    					WHERE EXTRACT(YEAR FROM date_w) = yr and
    					  	  EXTRACT(MONTH FROM date_w) = mon
    					GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    				else
    					if typeofwork is not null and obj is null then
    						RETURN QUERY
    						SELECT
   							date_trunc('year', date_w) as Period,
   							sum(plan) as Plann,
   							sum(fact) as Factt,
   							sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   							sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   							EXTRACT(YEAR FROM date_w) as yr,
   							EXTRACT(MONTH FROM date_w) as mont,
   							EXTRACT(DAY FROM date_w) as dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork and
    						  	  EXTRACT(YEAR FROM date_w) = yr and
    						  	  EXTRACT(MONTH FROM date_w) = mon
    						GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    					end if;
    				end if;
    			end if;
    		END IF;
    	else
    		IF typeofwork is not null and obj is not null then
				RETURN QUERY
				SELECT
   				date_trunc('year', date_w) as Period,
   				sum(plan) as Plann,
   				sum(fact) as Factt,
   				sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   				sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   				EXTRACT(YEAR FROM date_w) as year,
   				EXTRACT(MONTH FROM date_w) as month,
   				EXTRACT(DAY FROM date_w) as day
   				FROM public.plan_fact_analysis
    			WHERE object = obj and
   				  	  work = typeofwork and 
   				  	  EXTRACT(MONTH FROM date_w) = mon
    			GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    		else
    			if typeofwork is null and obj is not null then
    				RETURN QUERY
    				SELECT
   					date_trunc('year', date_w) as Period,
   					sum(plan) as Plann,
   					sum(fact) as Factt,
   					sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   					sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   					EXTRACT(YEAR FROM date_w) as year,
   					EXTRACT(MONTH FROM date_w) as month,
   					EXTRACT(DAY FROM date_w) as day
   					FROM public.plan_fact_analysis
    				WHERE object = obj and
    					  EXTRACT(MONTH FROM date_w) = mon
    				GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    			else
    				if typeofwork is null and obj is null then
    					RETURN QUERY
    					SELECT
   						date_trunc('year', date_w) as Period,
   						sum(plan) as Plann,
   						sum(fact) as Factt,
   						sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   						sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   						EXTRACT(YEAR FROM date_w) as yr,
   						EXTRACT(MONTH FROM date_w) as mont,
   						EXTRACT(DAY FROM date_w) as dayy
   						FROM public.plan_fact_analysis
    					WHERE EXTRACT(MONTH FROM date_w) = mon
    					GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    				else
    					if typeofwork is not null and obj is null then
    						RETURN QUERY
    						SELECT
   							date_trunc('year', date_w) as Period,
   							sum(plan) as Plann,
   							sum(fact) as Factt,
   							sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   							sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   							EXTRACT(YEAR FROM date_w) as yr,
   							EXTRACT(MONTH FROM date_w) as mont,
   							EXTRACT(DAY FROM date_w) as dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork and
    							  EXTRACT(MONTH FROM date_w) = mon
    						GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    					end if;
    				end if;
    			end if;
    		END IF;
   		end if;
   	else
   		if yr is not null then 	
			IF typeofwork is not null and obj is not null then
				RETURN QUERY
				SELECT
   				date_trunc('year', date_w) as Period,
   				sum(plan) as Plann,
   				sum(fact) as Factt,
   				sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   				sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   				EXTRACT(YEAR FROM date_w) as year,
   				EXTRACT(MONTH FROM date_w) as month,
   				EXTRACT(DAY FROM date_w) as day
   				FROM public.plan_fact_analysis
    			WHERE object = obj and
   				  	  work = typeofwork and 
   				  	  EXTRACT(YEAR FROM date_w) = yr
    			GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    		else
    			if typeofwork is null and obj is not null then
    				RETURN QUERY
    				SELECT
   					date_trunc('year', date_w) as Period,
   					sum(plan) as Plann,
   					sum(fact) as Factt,
   					sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   					sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   					EXTRACT(YEAR FROM date_w) as year,
   					EXTRACT(MONTH FROM date_w) as month,
   					EXTRACT(DAY FROM date_w) as day
   					FROM public.plan_fact_analysis
    				WHERE object = obj and 
    				  	  EXTRACT(YEAR FROM date_w) = yr
    				GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    			else
    				if typeofwork is null and obj is null then
    					RETURN QUERY
    					SELECT
   						date_trunc('year', date_w) as Period,
   						sum(plan) as Plann,
   						sum(fact) as Factt,
   						sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   						sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   						EXTRACT(YEAR FROM date_w) as yr,
   						EXTRACT(MONTH FROM date_w) as mont,
   						EXTRACT(DAY FROM date_w) as dayy
   						FROM public.plan_fact_analysis
    					WHERE EXTRACT(YEAR FROM date_w) = yr
    					GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    				else
    					if typeofwork is not null and obj is null then
    						RETURN QUERY
    						SELECT
   							date_trunc('year', date_w) as Period,
   							sum(plan) as Plann,
   							sum(fact) as Factt,
   							sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   							sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   							EXTRACT(YEAR FROM date_w) as yr,
   							EXTRACT(MONTH FROM date_w) as mont,
   							EXTRACT(DAY FROM date_w) as dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork and
    						  	  EXTRACT(YEAR FROM date_w) = yr
    						GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    					end if;
    				end if;
    			end if;
    		END IF;
    	else
    		IF typeofwork is not null and obj is not null then
				RETURN QUERY
				SELECT
   				date_trunc('year', date_w) as Period,
   				sum(plan) as Plann,
   				sum(fact) as Factt,
   				sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   				sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   				EXTRACT(YEAR FROM date_w) as year,
   				EXTRACT(MONTH FROM date_w) as month,
   				EXTRACT(DAY FROM date_w) as day
   				FROM public.plan_fact_analysis
    			WHERE object = obj and
   				  	  work = typeofwork 
    			GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    		else
    			if typeofwork is null and obj is not null then
    				RETURN QUERY
    				SELECT
   					date_trunc('year', date_w) as Period,
   					sum(plan) as Plann,
   					sum(fact) as Factt,
   					sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   					sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   					EXTRACT(YEAR FROM date_w) as year,
   					EXTRACT(MONTH FROM date_w) as month,
   					EXTRACT(DAY FROM date_w) as day
   					FROM public.plan_fact_analysis
    				WHERE object = obj
    				GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    			else
    				if typeofwork is null and obj is null then
    					RETURN QUERY
    					SELECT
   						date_trunc('year', date_w) as Period,
   						sum(plan) as Plann,
   						sum(fact) as Factt,
   						sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   						sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   						EXTRACT(YEAR FROM date_w) as yr,
   						EXTRACT(MONTH FROM date_w) as mont,
   						EXTRACT(DAY FROM date_w) as dayy
   						FROM public.plan_fact_analysis
    					GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    				else
    					if typeofwork is not null and obj is null then
    						RETURN QUERY
    						SELECT
   							date_trunc('year', date_w) as Period,
   							sum(plan) as Plann,
   							sum(fact) as Factt,
   							sum(plan) over (order by date_trunc('year', date_w)) as PlanKanop,
   							sum(fact) over (order by date_trunc('year', date_w)) as FactNakop,
   							EXTRACT(YEAR FROM date_w) as yr,
   							EXTRACT(MONTH FROM date_w) as mont,
   							EXTRACT(DAY FROM date_w) as dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork
    						GROUP BY date_trunc('year', date_w),date_w, plan, fact;
    					end if;
    				end if;
    			end if;
    		END IF;
   		end if;
   	end if;
END;
$$;

