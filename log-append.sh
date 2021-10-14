host=yandex.ru
host2=rbc.ru
host3=bbc.com
while :
do
now=$(date +%s)
val=$(ping -c 2 -q -n $host | lua ping.lua)
rrdtool update log_data.rrd $now:$val
echo "added $val at $now"
now=$(date +%s)
val2=$(ping -c 2 -q -n $host2 | lua ping.lua)
rrdtool update log_graph2.rrd $now:$val2
echo "added $val2 at $now"
now=$(date +%s)
val3=$(ping -c 2 -q -n $host3 | lua ping.lua)
rrdtool update log_graph3.rrd $now:$val3
echo "added $val3 at $now"
sleep 10
done
