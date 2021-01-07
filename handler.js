module.exports.hello = () => {
    return {
      body: JSON.stringify({
        data: 'hello!'
      }),
      statusCode: 200
    };
}