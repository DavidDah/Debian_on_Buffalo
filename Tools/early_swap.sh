devs="$(ls /sys/block | grep -v mtd)"
for dev in $devs
do
  swapon /dev/$dev
  for x in 1 2 3 4 5 6 7 8
  do
    swapon /dev/$dev$x
  done
done