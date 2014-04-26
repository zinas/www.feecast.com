select table_schema, count(table_schema) from information_schema.tables group by table_schema;

select table_schema, count(table_schema) from information_schema.tables where table_schema = 'feecastdb' group by table_schema;
select table_name, table_rows from information_schema.tables where table_schema = 'feecastdb';

-- select table_schema, count(table_schema) from information_schema.tables where table_schema = 'kserafim_chi' group by table_schema;
-- select table_name, table_rows from information_schema.tables where table_schema = 'kserafim_chi';
