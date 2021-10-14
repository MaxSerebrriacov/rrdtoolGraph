db=log_data
name1=my_ser

gr1=graph1
gr2=graph2
gr3=graph3

img=img.png

width=640
height=420

start=$(date +%s)

t0=$(expr $start - 2000)
t1=$start

rrdtool graphv $img \
 --width=$width \
 --height=$height \
 --start $t0 --end $t1 \
 --full-size-mode \
 --disable-rrdtool-tag \
 --font-render-mode light \
 --border 0 \
 --color ARROW#003299 --color AXIS#337733 \
 --color FRAME#220022 --color CANVAS#222222 \
 --color FONT#ffffff --color BACK#502010 \
 --color GRID#005555 --color MGRID#556655 \
 --color FONT#000000 \
 --graph-render-mode normal \
 --slope-mode \
 --title "uwu" \
 --watermark "$(cat /etc/hostname)" \
 DEF:$gr1=$db.rrd:$name1:AVERAGE \
 DEF:$gr2=log_graph2.rrd:graph2:AVERAGE \
 DEF:$gr3=log_graph3.rrd:graph3:AVERAGE \
 LINE1:$gr1#5500FF:File_1 \
 LINE2:$gr2#00FF00:File_2 \
 LINE3:$gr3#FF0000:File_3 \
 CDEF:rx=$gr1,$gr2,$gr3,'+','+'


