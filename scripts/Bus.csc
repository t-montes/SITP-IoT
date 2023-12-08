set route "A213"
atget id id
data message "route" id route 0

loop
    atnd n
    if (n > 0)
        send message
    end

    delay 200
