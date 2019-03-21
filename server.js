const Hapi = require('hapi');

const server = Hapi.server({
  port: 3333,
});

server.route({
  method: 'GET',
  path: '/health',
  handler: (request, h) => {
    const data = {
      status: 'OK',
    };

    return h.response(data).code(200);
  },
});

const init = async () => {
  await server.start();
  console.log(`Server running at: ${server.info.uri}`);
};

process.on('unhandledRejection', (reason, p) => {
  console.log('Unhandled Rejection at:', p, 'reason:', reason);
});

init();
