-- DDL statement
CREATE TABLE example_table (
  bank_id      INT          NOT NULL,
  object       INT          NOT NULL,
  version      INT          NOT NULL,
  templ_id     INT          NOT NULL,
  namespace_id INT          NOT NULL,
  noname       INT          NOT NULL,
  description  VARCHAR(200) NOT NULL,
--  maybe        varchar(255)?
  idx          INT          NOT NULL
);

CREATE TABLE another_example (
  templ_id INT NOT NULL
);

INSERT INTO example_table (bank_id, object, version, templ_id, namespace_id, noname, description, idx)
VALUES ((SELECT max(bank_id) + 1
         FROM example_table
         WHERE bank_id IS NOT
               NULL AND
               SUBSTRING(bank_id, '^\d+*$') AND
               instr(bank_id, 1) != 1),
        LAST_INSERT_ID(),
        1,
        (SELECT templ_id
         FROM another_example
         WHERE namespace_id = 'ALB-alb' AND noname = 'Edit Document'), 'Apple', 'Star', 'Sun', 'Y');
