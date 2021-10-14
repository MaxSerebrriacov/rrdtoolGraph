val=$1
db=log_data
start=$(date +%s)
min=$(expr $1 \* 60)
t0=$(expr $start - $min)
t1=$start
rrdtool fetch $db.rrd AVERAGE -s $t0 -e $t1
rrdtool fetch log_graph2.rrd AVERAGE -s $t0 -e $t1
rrdtool fetch log_graph3.rrd AVERAGE -s $t0 -e $t1
