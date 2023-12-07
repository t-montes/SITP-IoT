set my_route "OTHER"

// Initialize variables
atget id my_id
data discoverReqMsg "discoverReq" my_id my_route
data discoverResMsg "discoverRes" my_id my_route

atnd n nIds

vec nRoutes n

set i 0
while (i < n)
    vset 0 nRoutes i
    inc i
end

set missing n
set currentWait -1

loop 
    if (missing != 0)
        inc currentWait
        if (currentWait == n)
            set currentWait 0
        end
        vget nI nIds currentWait
        cprint "Waiting for " nI
        send discoverReqMsg nI
    //else
    //    set i 0
    //    while (i < n)
    //        vget x nRoutes i
    //        vget nI nIds i
    //        cprint "Route to " nI " is " x
    //        inc i
    //    end
    end

    read incomingMsg
    rdata incomingMsg msgType msgId msgRoute

    if ((msgType == "discoverRes") && (missing != 0))
        cprint "Received " msgId
        set i 0
        while (i < n)
            vget nI nIds i
            vget x nRoutes i
            if ((nI == msgId) && (x == 0))
                vset msgRoute nRoutes i
                dec missing
                set i n
            end
            inc i
        end
    end

    if (msgType == "discoverReq")
        cprint "Sent " msgId
        send discoverResMsg msgId
    end

    delay 500
