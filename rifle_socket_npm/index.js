RifleSocket = require('./lib/rifle_socket.js');
rs = RifleSocket();

process.argv.forEach(rs.parseArgs);

// process.argv.forEach(rs.parseArgs);
