use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nb.primaryName AS primaryName, tpc.category AS role, tp.numActor AS movies FROM title_principals tp
  LEFT JOIN name_basics nb
  ON nb.nconst = tp.nconst
  LEFT JOIN title_principals_category tpc
  ON tp.nconst = tpc.nconst
  WHERE tpc.category like 'actor' or tpc.category like 'actress'
  ORDER BY movies DESC
  LIMIT 3;
