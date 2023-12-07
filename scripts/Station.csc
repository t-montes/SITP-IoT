// Initialize variables
atget id id
data broadcastMessage "discover" id
set discovered ""

loop
    // Broadcast discovery message
    send broadcastMessage

    // Listen for incoming discovery messages
    read incomingMessage
    rdata incomingMessage type listenedId

    if(type == "discover")
        // Check if listenedId is already discovered
        //if (contains discovered listenedId ",")
            // ID already discovered, do nothing
        //else
            // Add the new sensor to discovered IDs
            concat discovered listenedId ","
            // Print output upon receiving a message
            print "I, sensor " id " listened " listenedId
        //end
    end

    delay 500
