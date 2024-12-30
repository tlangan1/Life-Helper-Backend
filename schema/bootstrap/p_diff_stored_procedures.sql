select lf.routine_name, lf.routine_definition, tlf.routine_definition from information_schema.routines lf
inner join information_schema.routines tlf on lf.routine_schema = 'life_helper'
and tlf.routine_schema = 't_life_helper' and lf.routine_name  = tlf.routine_name;
/* 33 rows */

select lf.routine_name, lf.routine_definition, tlf.routine_definition from information_schema.routines lf
inner join information_schema.routines tlf on lf.routine_schema = 'life_helper'
and tlf.routine_schema = 't_life_helper' and lf.routine_name  = tlf.routine_name
where lf.routine_definition = tlf.routine_definition;
/* 33 rows */

select lf.routine_name, lf.routine_definition, tlf.routine_definition from information_schema.routines lf
inner join information_schema.routines tlf on lf.routine_schema = 'life_helper'
and tlf.routine_schema = 't_life_helper' and lf.routine_name  = tlf.routine_name
where lf.routine_definition <> tlf.routine_definition;
/* 0 rows */
