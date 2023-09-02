const { Socket } = require('socket.io');
require('dotenv').config();
const port=process.env.PORT;
const http=require('http').createServer();

const io=require('socket.io')(http, {
    cors : {
        origin :'*'
    }
});

//client establishes websocket.io connection
io.on('connection',(Socket)=>{
    console.log('connected with user');

    Socket.on('message',(message)=>{
        io.emit('message', `The msg is:-- \n \n ${message}`);
    });
    
    Socket.on('disconnect',()=>console.log("Disconnected"));
});

http.listen(port || 8080,()=>{
    console.log(`Server @ PORT ${port}`);
})



// const WebSocket =require('ws');
// //We use this to import ws 
// const server=new WebSocket.Server({
//     port :  '8080'
// });
// //creates a websocket instance that is on port 8080

// server.on('connection' , socket=>{
//     //Inital Handshake done
//     socket.on('message',message=>{
//         //listen to incomming messgae

//         socket.send(`Done ${message}`);
//         //send back msg
//     });
// });