// Initialize variables
atget id id
data broadcastMessage "discover" id

loop
    // Broadcast message
    send broadcastMessage

    // Listen for incoming messages
    read incomingMessage
    rdata incomingMessage type listenedId

    if(type == "discover")
        // Parse the received message
        rdata incomingMessage listenedType listenedId

        // Print output upon receiving a message
        print "I, sensor " id " listened " listenedId
    end

    delay 500

