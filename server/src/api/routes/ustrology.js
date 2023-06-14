import express from 'express';
import asyncHandler from 'express-async-handler';

import { getUsers, getUsersById, getHoroscopes } from '../controllers/ustrology.js';
const router = express.Router();

// GET
router.get('/users', asyncHandler(getUsers));
router.get('/users/:id', asyncHandler(getUsersById));
router.get('/horoscopes', asyncHandler(getHoroscopes));
// DELETE
// router.delete('/', asyncHandler());
// POST
// router.post('/', asyncHandler());

export default router;
