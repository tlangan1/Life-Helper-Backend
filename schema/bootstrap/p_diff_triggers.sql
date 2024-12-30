select lf.action_statement, lf.action_statement, tlf.action_statement from information_schema.triggers lf
inner join information_schema.triggers tlf on lf.trigger_schema = 'life_helper'
and tlf.trigger_schema = 't_life_helper' and lf.action_statement  = tlf.action_statement;
/* 1 rows */

select lf.action_statement, lf.action_statement, tlf.action_statement from information_schema.triggers lf
inner join information_schema.triggers tlf on lf.trigger_schema = 'life_helper'
and tlf.trigger_schema = 't_life_helper' and lf.action_statement  = tlf.action_statement
where lf.action_statement = tlf.action_statement;
/* 1 rows */

select lf.action_statement, lf.action_statement, tlf.action_statement from information_schema.triggers lf
inner join information_schema.triggers tlf on lf.trigger_schema = 'life_helper'
and tlf.trigger_schema = 't_life_helper' and lf.action_statement  = tlf.action_statement
where lf.action_statement <> tlf.action_statement;
/* 0 rows */
