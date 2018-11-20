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
        SELECT dependent_id FROM task
        WHERE id = 3
    UNION ALL
        SELECT task.dependent_id FROM task
        INNER JOIN traverse
        ON traverse.dependent_id = task.id 
)

SELECT dependent_id FROM traverse;