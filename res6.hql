use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nconst, numActor, numDirector FROM title_principals
ORDER BY numActor;
