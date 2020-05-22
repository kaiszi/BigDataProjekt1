use persons;

INSERT overwrite local directory '/home/${hiveconf:user}/out' row format delimited fields terminated by ','

SELECT nb.nconst, nb.primaryName AS primaryName, nb.primaryProfession AS role, tp.numActor, tp.numDirector AS movies FROM title_principals tp
  INNER JOIN name_basics nb
  ON nb.nconst = tp.nconst
  --WHERE nb.primaryProfession like '%actor%' or nb.primaryProfession like '%actress%'
  ORDER BY movies DESC
