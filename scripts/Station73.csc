
loop
    receive msg
    rdata msg type idN route hop
    cprint "Route " route " is at " hop " stations"
