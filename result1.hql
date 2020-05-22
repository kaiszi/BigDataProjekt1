use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nb.primaryName, IF(tp.numActor > tp.numDirector, 'Actor', 'Director') AS Role, IF(tp.numActor > tp.numDirector, tp.numActor, tp.numDirector) FROM title_principals tp
  INNER JOIN name_basics nb
  ON nb.nconst = tp.nconst
  ORDER BY numActor DESC
  LIMIT 3;
