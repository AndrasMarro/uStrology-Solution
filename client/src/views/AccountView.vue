<script setup>
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useUserStore } from '@/stores/userStore.js';

const userStore = useUserStore();

let uname = ref('');
let password = ref('');

onMounted(async () => {
  const { user_id, username } = userStore.user;
  if (user_id != null) {
    const data = await axios.get(`/auth/users/${user_id}/password`);
    uname.value = username;
    password.value = data.data;
  }
});
</script>

<template>
  <div class="text-center text-white mt-5">
    <h3 class="my-3">{{ uname }}<span v-if="uname != ''">'s</span> Account</h3>
    <div class="mx-auto d-block">
      <router-link to="/home" class="hidden-link">Home</router-link> |
      <router-link to="/" class="hidden-link" @click="userStore.logout()">Logout</router-link>
    </div>
    <p class="mt-3">That's all!</p>
  </div>
</template>

<style scoped>
.hidden-link {
  color: inherit;
  text-decoration: none;
}
</style>
