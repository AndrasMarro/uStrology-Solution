import {
  dbgetUsers,
  dbgetUsersByUsername,
  dbgetUsersById,
  dbgetUsersByMail,
  dbgetHoroscopes,
  dbgetHoroscopesBySign,
  dbdeleteUsersById,
} from '../models/ustrology.js';

//#region GET
const getUsers = async (req, res) => {
  const { username, email } = req.query;
  let result = null;
  if (username) result = await dbgetUsersByUsername(username);
  else if (email) result = await dbgetUsersByMail(email);
  else result = await dbgetUsers();
  res.status(200).json(result.rows);
};
const getUsersById = async (req, res) => {
  const { id } = req.params;
  let result = null;
  if (id) result = await dbgetUsersById(id);
  res.status(200).json(result.rows);
};
const getHoroscopes = async (req, res) => {
  const { sign } = req.query;
  let result = [];
  if (sign) {
    let query = await dbgetHoroscopesBySign(sign);
    result.push(query.rows[Math.floor(Math.random() * 3)]);
    res.status(200).json(result);
  } else result = await dbgetHoroscopes();

  res.status(200).json(result.rows);
};
//#endregion

//#region DELETE

//#endregion

//#region POST
// const postTrainingplan = async (req, res) => {
//   const { name, description } = req.body;
//   let result = null;
//   let checkName = await dbgetTrainingplanByName(name);
//   if (checkName.rows.length === 0) {
//     await dbPostTrainingplan(name, description);
//     result = await dbgetTrainingplanByName(name);
//     res.status(200).json(result.rows);
//   } else {
//     res.status(500).send('Plan already exists in database');
//   }
// };
//#endregion

export { getUsers, getUsersById, getHoroscopes };
