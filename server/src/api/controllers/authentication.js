import * as model from '../models/ustrology.js';
import { validateLogin, validateRegister } from '../../validators/login.js';
import bcrypt from 'bcrypt';

const login = async (req, res) => {
  const error = validateLogin(req.body);
  if (error) return res.status(400).json(error);
  const { email, password } = req.body;
  const { rows } = await model.dbgetUsersByMail(email);
  if (rows.length === 0) return res.status(401).end();
  const checkPassword = await bcrypt.compare(password, rows[0].password);
  if (!checkPassword && password != rows[0].password)
    return res.status(400).send({ error: 'Invalid credentials' });
  const { user_id, username } = rows[0];
  req.session.userId = user_id;
  return res.status(200).json({ user_id, username });
};

const register = async (req, res) => {
  const error = validateRegister(req.body);
  if (error) return res.status(400).json(error);
  const { username, email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  const checkMail = await model.dbgetUsersByMail(email);
  if (checkMail.rows.length !== 0) {
    return res.status(409).send('The email address is already registered!');
  }
  await model.dbregisterUsers(username, email, hashedPassword);
  return res.status(200).send('Congratulations! You are registered!');
};

const logout = (req, res) => {
  req.session.destroy();
  res.clearCookie(process.env.SESSION_NAME);
  res.sendStatus(200).end();
};

const getPassword = async (req, res) => {
  const { rows } = await model.dbgetUsersById(Number(req.params.id));
  if (!rows.length === 0) return res.status(404).send('Server error!');
  return res.status(200).send(rows[0].password);
};

const deleteUser = async (req, res) => {
  const { id } = req.params;
  if (id) await dbdeleteUsersById(id);
  else res.status(500).send(`user with id ${id}, already deleted`);
  res.status(200).send(`user with id ${id}, deleted`);
};

export { login, register, logout, getPassword, deleteUser };
