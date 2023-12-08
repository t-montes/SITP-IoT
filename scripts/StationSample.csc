// n: number of neighbors, to which routhe the message
// t: each of the neighbor IDs in the position i,0
set my_route  "A213"

set n 1
tab t 1 1
tset 67 t 0 0

set fromBus 0

loop
    // read the message
    read message
    rdata message type idN route

    cprint "received " route " from " idN

    if ((type == "route") && (route == my_route))
        cprint "message arrived to destination"
        // sent from bus 1 or 2
        if ((idN == 71) || (idN == 72))
            if (fromBus == 0)
                set i 0
                while (i < n)
                    tget x t i 0
                    send message x
                    cprint "sending " route " to " x
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
                send message x
                cprint "sending " route " to " x
                delay 50
                inc i
            end
        end
    end

    delay 200
