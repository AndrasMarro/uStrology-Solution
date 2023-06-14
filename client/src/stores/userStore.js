import axios from 'axios';
import { defineStore } from 'pinia';
import { ref } from 'vue';

export const useUserStore = defineStore(
  'userstore',
  () => {
    const user = ref({
      user_id: null,
      username: null,
    });

    const saveUserData = ({ user_id, username }) => {
      user.value.user_id = user_id;
      user.value.username = username;
      // console.log(user.value);
    };

    const logout = async () => {
      await axios.get('/auth/logout');
      user.value.user_id = null;
      user.value.username = null;
    };

    const isAuthenticated = () => user.value.user_id != null;

    return { user, isAuthenticated, saveUserData, logout };
  },
  { persist: { storage: localStorage } },
);
