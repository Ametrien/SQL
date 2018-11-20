drop table if exists task
CREATE TABLE task (
id INT PRIMARY KEY,
dependent_id INT REFERENCES task
);

INSERT INTO task VALUES 
(4, 2),
(3, 2),
(2, 1),
(1, 0),
(5, 0),
(0, null);

WITH traverse AS (
        SELECT id FROM task
        WHERE dependent_id = 0
    UNION ALL
        SELECT task.id FROM task
        INNER JOIN traverse
        ON task.dependent_id = traverse.id
)

SELECT id FROM traverse;