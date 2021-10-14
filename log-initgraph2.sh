DB=mr6363_2
start=$(date +%s)
echo $start>log-start.txt
interval=15
name=graph2
type=GAUGE
min=5
max=1500
step=10
vals=5
rows=1000
func=AVERAGE
cap30=$(expr 30 \* 60)
cap60=$(expr 60 \* 60)
stv=$(expr $step \* $vals)
rows30=$(expr $cap30 / $stv)
rows60=$(expr $cap60 / $stv)
rrdtool create log_graph2.rrd \
--start $start \
--step $step \
DS:$name:$type:$interval:$min:$max \
RRA:$func:0.5:$vals:$rows \
RRA:$func:0.5:$vals:$rows30 \
RRA:$func:0.5:$vals:$rows60 

