use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nb.primaryName AS primaryName, IF(tp.numActor > tp.numDirector, 'Actor', 'Director') AS role, tp.numActor AS movies FROM title_principals tp
  INNER JOIN name_basics nb
  ON nb.nconst = tp.nconst
  WHERE tp.numActor > tp.numDirector
  ORDER BY tp.numActor DESC
  LIMIT 3;
