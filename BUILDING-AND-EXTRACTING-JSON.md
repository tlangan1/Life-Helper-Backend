When you build the JSON with `JSON_OBJECT('user_login_id', @user_login_id)`, the variable type depends on how it was last used.

In your test, @user_login_id is set as an integer at line 10:

```sql
set @user_login_id = 4;
```

However, when later extracted from JSON with `JSON_EXTRACT(data, '$.user_login_id')` in procedures like `p_update_item`, it may be returned as a string `"4"` depending on how the JSON encoding happened.

To ensure it stays numeric in the JSON, explicitly cast it when building the JSON:

```sql
set @JSON = JSON_OBJECT('update_type', 'start', 'item_id', @task_1_id, 'user_login_id', CAST(@user_login_id AS UNSIGNED));
```

Or when extracting it in the receiving procedure, cast it:

```sql
set @user_login_id = CAST(JSON_EXTRACT(data, '$.user_login_id') AS UNSIGNED);
```

The safest approach: cast both when building and extracting JSON to ensure type consistency throughout the call chain.
