wget http://www.cs.put.poznan.pl/kjankiewicz/bigdata/projekt1/title.principals.tsv.gz
wget https://raw.githubusercontent.com/kaiszi/BigDataProjekt1/master/mapper.py
wget https://raw.githubusercontent.com/kaiszi/BigDataProjekt1/master/reducer.py
gunzip title.principals.tsv.gz
sed -i 5000,+9999999999999999d title.principals.tsv
hadoop fs -mkdir -p in
hadoop fs -copyFromLocal title.principals.tsv in/
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar -files reducer.py,mapper.py -mapper mapper.py -reducer reducer.py -input in\* -output out_python
