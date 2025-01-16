-- This will list any triggers with the same name but different contants

-- Compare life_helper to t_life_helper
select "Compare life_helper to t_life_helper" as label, lf.routine_name from information_schema.routines lf
inner join information_schema.routines tlf on lf.routine_name  = tlf.routine_name
where lf.routine_schema = 'life_helper'
and tlf.routine_schema = 't_life_helper'
and lf.routine_definition != tlf.routine_definition;

-- Compare life_helper to test_life_helper
select "Compare life_helper to test_life_helper" as label, lf.routine_name from information_schema.routines lf
inner join information_schema.routines tlf on lf.routine_name  = tlf.routine_name
where lf.routine_schema = 'life_helper'
and tlf.routine_schema = 'test_life_helper'
and lf.routine_definition != tlf.routine_definition;
