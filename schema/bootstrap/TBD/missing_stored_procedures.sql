-- See what stored procedures exist in life_helper that do not exist in t_life_helper
select "Compare life_helper to t_life_helper" as label, lf.routine_name from information_schema.routines lf
where lf.routine_schema = 'life_helper'
and not exists (select tlf.routine_name from information_schema.routines tlf
where tlf.routine_schema = 't_life_helper'
and lf.routine_name = tlf.routine_name);

-- See what triggers exist in life_helper that do not exist in test_life_helper
select "Compare life_helper to test_life_helper" as label, lf.routine_name from information_schema.routines lf
where lf.routine_schema = 'life_helper'
and not exists (select tlf.routine_name from information_schema.routines tlf
where tlf.routine_schema = 'test_life_helper'
and lf.routine_name = tlf.routine_name);