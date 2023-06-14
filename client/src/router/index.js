import { createRouter, createWebHistory } from 'vue-router';
import HomeView from '../views/HomeView.vue';
import LoginView from '../views/LoginView.vue';
import RegisterView from '../views/RegisterView.vue';
import AccountView from '../views/AccountView.vue';
import { useUserStore } from '@/stores/userStore.js';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  beforeEnter: (to, from, next) => {
    const userStore = useUserStore();
    if (!userStore.isAuthenticated()) next({ name: 'Login' });
    else next();
  },
  routes: [
    {
      path: '/home',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/',
      name: 'login',
      component: LoginView,
    },
    {
      path: '/register',
      name: 'registrieren',
      component: RegisterView,
    },
    {
      path: '/account',
      name: 'account',
      component: AccountView,
    },
    { path: '/:catchAll(.*)', component: () => HomeView },
  ],
});

export default router;
