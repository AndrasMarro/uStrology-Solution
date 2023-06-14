import colors from 'colors';

const errorHandler = (err, req, res) => {
  console.log(colors.red(`Error ===> ${err.message}`));
  res.status(500).send('Server error');
};
const notFoundHandler = (req, res, next) => {
  console.log(colors.blue(`Not found ===> ${req.originalUrl}`));
  res.status(404).send('The ressource was not found on this server!');
  next();
};
const csrfErrorHandler = (err, req, res, next) => {
  if (err.code !== 'EBADCSRFTOKEN') return next(err);
  res.status(403);
  return res.send('Invalid CSRF token');
};

export { errorHandler, notFoundHandler, csrfErrorHandler };
