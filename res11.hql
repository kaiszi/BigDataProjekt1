use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT tp.nconst, ISNULL(numActor, 0), ISNULL(numDirector, 0) FROM title_principals tp
INNER JOIN name_basics nb
ON tp.nconst = nb.nconst
ORDER BY numActor DESC
LIMIT 3;
