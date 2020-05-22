mkdir out
hadoop fs -copyToLocal out_python out

wget http://www.cs.put.poznan.pl/kjankiewicz/bigdata/projekt1/name.basics.tsv.gz
gunzip name.basics.tsv.gz
sed -i 5000,+9999999999999999d name.basics.tsv

wget https://raw.githubusercontent.com/kaiszi/BigDataProjekt1/master/hive.hql
hive -hiveconf user=kbakula97 -f hive.hql

wget https://raw.githubusercontent.com/kaiszi/BigDataProjekt1/master/result.hql
hive -hiveconf user=kbakula97 -f result.hql

cat out/000000_0 > result
cat result
