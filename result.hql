use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nconst, numActor FROM title_principals
ORDER BY numActor DESC
LIMIT 3

UNION

SELECT nconst, numDirector FROM title_principals
ORDER BY numDirector DESC
LIMIT 3;
