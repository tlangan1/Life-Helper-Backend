-- This will list any triggers with the same name but different contants 

-- Compare life_helper to t_life_helper
select "Compare life_helper to t_life_helper" as label, lf.trigger_name from information_schema.triggers lf
inner join information_schema.triggers tlf on lf.trigger_name = tlf.trigger_name
where lf.trigger_schema = 'life_helper'
and tlf.trigger_schema = 't_life_helper'
and lf.action_statement != tlf.action_statement;

-- Compare life_helper to t_life_helper
select "Compare life_helper to test_life_helper" as label, lf.trigger_name from information_schema.triggers lf
inner join information_schema.triggers tlf on lf.trigger_name = tlf.trigger_name
where lf.trigger_schema = 'life_helper'
and tlf.trigger_schema = 'test_life_helper'
and lf.action_statement != tlf.action_statement;
