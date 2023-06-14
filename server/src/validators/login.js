import Joi from 'joi';

const login = {
  email: Joi.string().email({
    minDomainSegments: 2,
    tlds: { allow: ['com', 'net', 'at', 'ch', 'jp'] },
  }),
  password: Joi.string().min(4).alphanum().required(),
};
const register = {
  username: Joi.string()
    .min(3)
    .pattern(/^[a-züöäßA-ZÜÖÄ]+$/)
    .required(),
  ...login,
};

const options = {
  abortEarly: true,
  errors: {
    wrap: { label: '' },
  },
};

const loginSchema = Joi.object(login);
const registerSchema = Joi.object(register);

const validateLogin = (obj) => {
  const { error } = loginSchema.validate(obj, options);
  return error ? error.details.map((el) => el.message) : null;
};
const validateRegister = (obj) => {
  const { error } = registerSchema.validate(obj, options);
  return error ? error.details.map((el) => el.message) : null;
};

export { validateLogin, validateRegister };
