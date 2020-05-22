use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nb.primaryName AS primaryName, tpc.category AS role, tp.numActor AS movies FROM title_principals tp
  INNER JOIN name_basics nb
  ON nb.nconst = tp.nconst
  INNER JOIN title_principals_category tpc
  ON nb.nconst = tpc.nconst
  WHERE tpc.category like 'actor' or tpc.category like 'actress'
  ORDER BY movies DESC
  LIMIT 3;
