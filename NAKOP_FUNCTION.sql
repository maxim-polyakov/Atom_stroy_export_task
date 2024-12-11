CREATE OR REPLACE FUNCTION Nakop(yr integer, mon integer, obj varchar, typeofwork varchar)
RETURNS TABLE (Period timestamptz, Plann  bigint, Factt  bigint, PlanNakop  bigint, FactNakop  bigint, yer  numeric, mont  numeric, dayy  numeric)
LANGUAGE plpgsql AS
$$
BEGIN
	IF mon IS NOT NULL then
		IF yr IS NOT NULL THEN 	
			IF typeofwork IS NOT NULL AND obj IS NOT NULL THEN
				RETURN QUERY
				SELECT
   				date_trunc('month', date_w) AS Period,
   				sum(plan) AS Plann,
   				sum(fact) AS Factt,
   				sum(plan) OVER (ORDER BY date_trunc('month', date_w)) AS PlanKanop,
   				sum(fact) OVER (order BY date_trunc('month', date_w)) AS FactNakop,
   				EXTRACT(YEAR FROM date_w) AS yer,
   				EXTRACT(MONTH FROM date_w) AS mont,
   				EXTRACT(DAY FROM date_w) AS dayy
   				FROM public.plan_fact_analysis
    			WHERE object = obj AND
   				  	  work = typeofwork AND 
   				  	  EXTRACT(YEAR FROM date_w) = yr AND
   				  	  EXTRACT(MONTH FROM date_w) = mon
    			GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    		ELSE
    			IF typeofwork IS NULL AND obj IS NOT NULL THEN
    				RETURN QUERY
    				SELECT
   					date_trunc('year', date_w) AS Period,
   					sum(plan) AS Plann,
   					sum(fact) AS Factt,
   					sum(plan) OVER (ORDER BY date_trunc('month', date_w)) AS PlanKanop,
   					sum(fact) OVER (ORDER BY date_trunc('month', date_w)) AS FactNakop,
   					EXTRACT(YEAR FROM date_w) AS yer,
   					EXTRACT(MONTH FROM date_w) AS mont,
   					EXTRACT(DAY FROM date_w) AS dayy
   					FROM public.plan_fact_analysis
    				WHERE object = obj AND 
    				  	  EXTRACT(YEAR FROM date_w) = yr AND
    				  	  EXTRACT(MONTH FROM date_w) = mon
    				GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    			ELSE
    				IF typeofwork IS NULL AND obj IS NULL THEN
    					RETURN QUERY
    					SELECT
   						date_trunc('month', date_w) AS Period,
   						sum(plan) AS Plann,
   						sum(fact) AS Factt,
   						sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   						sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   						EXTRACT(YEAR FROM date_w) AS yer,
   						EXTRACT(MONTH FROM date_w) AS mont,
   						EXTRACT(DAY FROM date_w) AS dayy
   						FROM public.plan_fact_analysis
    					WHERE EXTRACT(YEAR FROM date_w) = yr AND
    					  	  EXTRACT(MONTH FROM date_w) = mon
    					GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    				ELSE
    					IF typeofwork IS NOT NULL AND obj IS NULL then
    						RETURN QUERY
    						SELECT
   							date_trunc('month', date_w) AS Period,
   							sum(plan) AS Plann,
   							sum(fact) AS Factt,
   							sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   							sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   							EXTRACT(YEAR FROM date_w) AS yer,
   							EXTRACT(MONTH FROM date_w) AS mont,
   							EXTRACT(DAY FROM date_w) AS dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork AND
    						  	  EXTRACT(YEAR FROM date_w) = yr AND
    						  	  EXTRACT(MONTH FROM date_w) = mon
    						GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    					END IF;
    				END IF;
    			END IF;
    		END IF;
    	ELSE
    		IF typeofwork IS NOT NULL AND obj IS NOT NULL then
				RETURN QUERY
				SELECT
   				date_trunc('month', date_w) AS Period,
   				sum(plan) AS Plann,
   				sum(fact) AS Factt,
   				sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   				sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   				EXTRACT(YEAR FROM date_w) AS yer,
   				EXTRACT(MONTH FROM date_w) AS mont,
   				EXTRACT(DAY FROM date_w) AS dayy
   				FROM public.plan_fact_analysis
    			WHERE object = obj AND
   				  	  work = typeofwork AND 
   				  	  EXTRACT(MONTH FROM date_w) = mon
    			GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    		ELSE
    			IF typeofwork IS NULL AND obj IS NOT NULL then
    				RETURN QUERY
    				SELECT
   					date_trunc('month', date_w) AS Period,
   					sum(plan) AS Plann,
   					sum(fact) AS Factt,
   					sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   					sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   					EXTRACT(YEAR FROM date_w) AS yer,
   					EXTRACT(MONTH FROM date_w) AS mont,
   					EXTRACT(DAY FROM date_w) AS dayy
   					FROM public.plan_fact_analysis
    				WHERE object = obj AND
    					  EXTRACT(MONTH FROM date_w) = mon
    				GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    			ELSE
    				IF typeofwork IS NULL AND obj IS NULL then
    					RETURN QUERY
    					SELECT
   						date_trunc('month', date_w) AS Period,
   						sum(plan) AS Plann,
   						sum(fact) AS Factt,
   						sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   						sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   						EXTRACT(YEAR FROM date_w) AS yer,
   						EXTRACT(MONTH FROM date_w) AS mont,
   						EXTRACT(DAY FROM date_w) AS dayy
   						FROM public.plan_fact_analysis
    					WHERE EXTRACT(MONTH FROM date_w) = mon
    					GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    				ELSE
    					IF typeofwork IS NOT NULL AND obj IS NULL then
    						RETURN QUERY
    						SELECT
   							date_trunc('month', date_w) AS Period,
   							sum(plan) AS Plann,
   							sum(fact) AS Factt,
   							sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   							sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   							EXTRACT(YEAR FROM date_w) AS yer,
   							EXTRACT(MONTH FROM date_w) AS mont,
   							EXTRACT(DAY FROM date_w) AS dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork AND
    							  EXTRACT(MONTH FROM date_w) = mon
    						GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    					END IF;
    				END IF;
    			END IF;
    		END IF;
   		END IF;
   	ELSE
   		IF yr IS NOT NULL then 	
			IF typeofwork IS NOT NULL AND obj IS NOT NULL then
				RETURN QUERY
				SELECT
   				date_trunc('month', date_w) AS Period,
   				sum(plan) AS Plann,
   				sum(fact) AS Factt,
   				sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   				sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   				EXTRACT(YEAR FROM date_w) AS yer,
   				EXTRACT(MONTH FROM date_w) AS mont,
   				EXTRACT(DAY FROM date_w) AS dayy
   				FROM public.plan_fact_analysis
    			WHERE object = obj AND
   				  	  work = typeofwork AND 
   				  	  EXTRACT(YEAR FROM date_w) = yr
    			GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    		ELSE
    			IF typeofwork IS NULL AND obj IS NOT NULL then
    				RETURN QUERY
    				SELECT
   					date_trunc('month', date_w) AS Period,
   					sum(plan) AS Plann,
   					sum(fact) AS Factt,
   					sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   					sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   					EXTRACT(YEAR FROM date_w) AS yer,
   					EXTRACT(MONTH FROM date_w) AS mont,
   					EXTRACT(DAY FROM date_w) AS dayy
   					FROM public.plan_fact_analysis
    				WHERE object = obj AND 
    				  	  EXTRACT(YEAR FROM date_w) = yr
    				GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    			ELSE
    				IF typeofwork IS NULL AND obj IS NULL then
    					RETURN QUERY
    					SELECT
   						date_trunc('month', date_w) AS Period,
   						sum(plan) AS Plann,
   						sum(fact) AS Factt,
   						sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   						sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   						EXTRACT(YEAR FROM date_w) AS yer,
   						EXTRACT(MONTH FROM date_w) AS mont,
   						EXTRACT(DAY FROM date_w) AS dayy
   						FROM public.plan_fact_analysis
    					WHERE EXTRACT(YEAR FROM date_w) = yr
    					GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    				ELSE
    					IF typeofwork IS NOT NULL AND obj IS NULL then
    						RETURN QUERY
    						SELECT
   							date_trunc('month', date_w) AS Period,
   							sum(plan) AS Plann,
   							sum(fact) AS Factt,
   							sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   							sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   							EXTRACT(YEAR FROM date_w) AS yer,
   							EXTRACT(MONTH FROM date_w) AS mont,
   							EXTRACT(DAY FROM date_w) AS dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork AND
    						  	  EXTRACT(YEAR FROM date_w) = yr
    						GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    					END IF;
    				END IF;
    			END IF;
    		END IF;
    	ELSE
    		IF typeofwork IS NOT NULL AND obj IS NOT NULL then
				RETURN QUERY
				SELECT
   				date_trunc('month', date_w) AS Period,
   				sum(plan) AS Plann,
   				sum(fact) AS Factt,
   				sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   				sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   				EXTRACT(YEAR FROM date_w) AS yer,
   				EXTRACT(MONTH FROM date_w) AS mont,
   				EXTRACT(DAY FROM date_w) AS dayy
   				FROM public.plan_fact_analysis
    			WHERE object = obj AND
   				  	  work = typeofwork 
    			GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    		ELSE
    			IF typeofwork IS NULL AND obj IS NOT NULL then
    				RETURN QUERY
    				SELECT
   					date_trunc('month', date_w) AS Period,
   					sum(plan) AS Plann,
   					sum(fact) AS Factt,
   					sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   					sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   					EXTRACT(YEAR FROM date_w) AS yer,
   					EXTRACT(MONTH FROM date_w) AS mont,
   					EXTRACT(DAY FROM date_w) AS dayy
   					FROM public.plan_fact_analysis
    				WHERE object = obj
    				GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    			ELSE
    				IF typeofwork IS NULL AND obj IS NULL then
    					RETURN QUERY
    					SELECT
   						date_trunc('month', date_w) AS Period,
   						sum(plan) AS Plann,
   						sum(fact) AS Factt,
   						sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   						sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   						EXTRACT(YEAR FROM date_w) AS yer,
   						EXTRACT(MONTH FROM date_w) AS mont,
   						EXTRACT(DAY FROM date_w) AS dayy
   						FROM public.plan_fact_analysis
    					GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    				ELSE
    					IF typeofwork IS NOT NULL AND obj IS NULL then
    						RETURN QUERY
    						SELECT
   							date_trunc('month', date_w) AS Period,
   							sum(plan) AS Plann,
   							sum(fact) AS Factt,
   							sum(plan) over (order by date_trunc('month', date_w)) AS PlanKanop,
   							sum(fact) over (order by date_trunc('month', date_w)) AS FactNakop,
   							EXTRACT(YEAR FROM date_w) AS yer,
   							EXTRACT(MONTH FROM date_w) AS mont,
   							EXTRACT(DAY FROM date_w) AS dayy
   							FROM public.plan_fact_analysis
    						WHERE work = typeofwork
    						GROUP BY date_trunc('month', date_w),date_w, plan, fact;
    					END IF;
    				END IF;
    			END IF;
    		END IF;
   		END IF;
   	END IF;
END;
$$;