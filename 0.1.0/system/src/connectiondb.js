var pg = require('pg');
var connectionString = "postgres://postgres:io_passw0rd@localhost:5432/test";
var pgClient = new pg.Client(connectionString);

pgClient.connect();
var query = "select * from sexo";

pgClient.query(query, (err, res) => {
  if (err) {
    console.log(err.stack);
  } else {
    for (var i = 0; i < res.rowCount; i++) {
      console.log(res.rows[i]);
    }
  }
  pgClient.end();
})
