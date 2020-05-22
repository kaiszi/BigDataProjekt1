use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

(SELECT nb.primaryName, numActor FROM title_principals tp
LEFT JOIN name_basics nb
ON tp.nconst = nb.nconst
ORDER BY numActor DESC
LIMIT 3)
Union
(SELECT nb.primaryName, numDirector FROM title_principals tp
LEFT JOIN name_basics nb
ON tp.nconst = nb.nconst
ORDER BY numDirector DESC
LIMIT 3);
