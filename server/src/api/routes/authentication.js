import express from 'express';
import {
  login,
  logout,
  register,
  getPassword,
  deleteUser,
  // changePassword,
} from '../controllers/authentication.js';

const router = express.Router();
const redirectLogin = (req, res, next) => {
  if (req.session.userID) res.status(404).send('You are not logged in');
  else next();
};

router.post('/login', login);
router.post('/register', register);
router.get('/logout', logout);
router.get('/users/:id/password', redirectLogin, getPassword);
//
router.delete('/users/:id', redirectLogin, deleteUser);
// router.post('/users/:id', redirectLogin, changePassword);

export default router;
