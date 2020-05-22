use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT tp.nconst, numActor, numDirector FROM title_principals tp
INNER JOIN name_basics nb
ON tp.nconst = nb.nconst
ORDER BY numActor DESC
LIMIT 3;
