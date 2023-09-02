const WebSocket =require('ws');
//We use this to import ws 
const server=new WebSocket.Server({
    port :  '8080'
});
//creates a websocket instance that is on port 8080

server.on()