import { query } from '../../db/index.js';

//#region GET
const dbgetUsers = () => query('SELECT * FROM users ORDER BY user_id');
const dbgetUsersByUsername = (username) =>
  query('SELECT * FROM users WHERE username LIKE $1 ORDER BY user_id', [`%${username}%`]);
const dbgetUsersById = (id) => query('SELECT * FROM users WHERE user_id = $1', [id]);
const dbgetUsersByMail = (email) => query('SELECT * FROM users WHERE email = $1', [email]);
const dbgetUsersByMailPassword = (email, password) =>
  query('SELECT * FROM users WHERE email = $1 AND password = $2', [email, password]);
const dbgetHoroscopes = () => query('SELECT * FROM horoscopes ORDER BY horoscope_id');
const dbgetHoroscopesBySign = (sign) =>
  query('SELECT * FROM horoscopes WHERE sign = $1 ORDER BY sign', [sign]);
//#endregion

//#region DELETE
const dbdeleteUsersById = (id) => query('DELETE FROM users WHERE user_id = $1', [id]);
//#endregion

//#region POST
const dbregisterUsers = (username, email, password) =>
  query(`insert into users(username,  email, password) values ( $1, $2, $3)`, [
    username,
    email,
    password,
  ]);
//#endregion

export {
  dbgetUsers,
  dbgetUsersByUsername,
  dbgetUsersById,
  dbgetUsersByMail,
  dbgetUsersByMailPassword,
  dbgetHoroscopes,
  dbgetHoroscopesBySign,
  dbdeleteUsersById,
  dbregisterUsers,
};
