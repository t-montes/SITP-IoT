// n: number of neighbors, to which routhe the message
// t: each of the neighbor IDs in the position i,0
set my_route  "D213"
atget id id

set n 1
tab t n 1
tset 4 t 0 0

set fromBus 0

loop
    // read the message
    read message
    rdata message type idN route hop

    if ((type == "route") && (route == my_route))
        // sent from bus 1 or 2
        if ((idN == 71) || (idN == 72))
            if (fromBus == 0)
                set i 0
                while (i < n)
                    tget x t i 0

                    set nhop hop
                    inc nhop
                    data newMessage type id route nhop

                    send newMessage x
                    delay 50
                    inc i
                end
            end
            set fromBus 1
        // resent from other node
        else
            set i 0
            while (i < n)
                tget x t i 0

                set nhop hop
                inc nhop
                data newMessage type idN route nhop

                send newMessage x
                delay 50
                inc i
            end
        end
    end

    delay 200
