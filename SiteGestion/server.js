//Import
const http = require('http');

//Variable
const hostname = "127.0.0.1";
const port = 8080;

//Server
const server = http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
  });

server.listen(port, hostname, function () {
    console.log(`Server running at http://${hostname}:${port}/`);
})

