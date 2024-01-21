var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);


app.get('/', function(req, res){
    console.log('server boshlandi!')
 });

 //Whenever someone connects this gets executed
io.on('connection', function(socket){
    console.log('socket becend ishga tushdi');
    
    //Whenever someone disconnects this piece of code executed
    socket.on('disconnect', function () {
       console.log('A user disconnected');
    });

    socket.on("habaryuborish",function(xabar){
        console.log(xabar)
    })
 });
 
 http.listen(3000, function(){
    console.log('listening on *:3000');
 });