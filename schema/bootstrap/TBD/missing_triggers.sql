-- See what triggers exist in life_helper that do not exist in t_life_helper
select "Compare life_helper to t_life_helper" as label, lf.trigger_name from information_schema.triggers lf
where lf.trigger_schema = 'life_helper'
and not exists (select tlf.trigger_name from information_schema.triggers tlf
where tlf.trigger_schema = 't_life_helper'
and lf.trigger_name = tlf.trigger_name);

-- See what triggers exist in life_helper that do not exist in test_life_helper
select "Compare life_helper to test_life_helper" as label, lf.trigger_name from information_schema.triggers lf
where lf.trigger_schema = 'life_helper'
and not exists (select tlf.trigger_name from information_schema.triggers tlf
where tlf.trigger_schema = 'test_life_helper'
and lf.trigger_name = tlf.trigger_name);

