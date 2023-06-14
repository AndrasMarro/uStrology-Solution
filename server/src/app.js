import dotenv from 'dotenv';
import express from 'express';
import session from 'express-session';
import helmet from 'helmet';
import morgan from 'morgan';
import cors from 'cors';

import { errorHandler, notFoundHandler } from './error/errorHandler.js';
import routes from './api/routes/authentication.js';
import ustrologyRouter from './api/routes/ustrology.js';

dotenv.config();
const { NODE_ENV, SESSION_LIFETIME, SESSION_NAME, SESSION_SECRET } = process.env;
const app = express();

app.use(morgan('tiny'));
app.use(helmet());
app.use(express.json());
app.use(
  cors({
    origin: ['http://localhost:3000'],
    credentials: true,
  }),
);

app.use(
  session({
    secret: SESSION_SECRET,
    name: SESSION_NAME,
    saveUninitialized: false,
    resave: false,
    cookie: {
      maxAge: SESSION_LIFETIME * 1000 * 60 * 60,
      httpOnly: false,
      sameSite: false,
      secure: NODE_ENV === 'production',
    },
  }),
);

app.use('/auth', routes);
app.use('/ustrology', ustrologyRouter);
app.use(notFoundHandler);
app.use(errorHandler);

const PORT = process.env.PORT ?? 5555;

app.listen(PORT, () => console.log(`Listening on port ${PORT}`));
console.log('Server started');
