use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nb.primaryName AS primaryName, IF(tp.numActor > tp.numDirector, 'Actor', 'Director') AS role, IF(tp.numActor > tp.numDirector, tp.numActor, tp.numDirector) AS movies FROM title_principals tp
  INNER JOIN name_basics nb
  ON nb.nconst = tp.nconst
  ORDER BY movies DESC
  LIMIT 3;
