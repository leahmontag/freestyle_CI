// Set the NODE_ENV environment variable to 'development'
process.env.NODE_ENV = 'development';

require('dotenv').config();

const app = require('./server');
require('./database');

// Server is listening
app.listen(app.get('port'), () => {
  console.log('Server on port', app.get('port'));
  console.log('Environment:', process.env.NODE_ENV);
});