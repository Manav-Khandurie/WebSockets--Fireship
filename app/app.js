
const socket= io('ws://localhost:8080');

socket.on('message', text=>{

    const el=document.createElement("ul");
    el.innerHTML=text;
    document.querySelector('ul').appendChild(el);
});

document.querySelector('button').onclick= ()=>{

    const text=document.querySelector('input').value;
    socket.emit('message',text);
}






// const sock=new WebSocket("ws://localhost:8080");
// // Browser would have a build in websocket class
// // The "ws" triggers the handshake

// sock.onmessage= function(event){

//     console.log("msg "+event.data);

// };

// sock.querrySelector('button').onclick =()=>{
    
//     sock.send('Hi');
// };