<script setup>
import axios from 'axios';
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useUserStore } from '@/stores/userStore.js';
const userStore = useUserStore();
const router = useRouter();

let valid = ref(true);

let email = ref('Amgad@Darwish.at');
let password = ref('deez');

const login = async () => {
  try {
    const { data } = await axios.post('/auth/login', {
      email: email.value,
      password: password.value,
    });
    valid.value = true;
    userStore.saveUserData(data);
    router.push('/home');
  } catch (error) {
    valid.value = false;
  }
};
</script>

<template>
  <form @submit.prevent="login">
    <div class="form-bg d-flex justify-content-center align-items-center min-vh-100">
      <div class="row border rounded-5 p-3 bg-dark shadow area-form">
        <!-- #region ERROR MESSAGE -->
        <div v-if="!valid" class="row justify-content-center">
          <div class="col-md-6">
            <p class="alert alert-danger text-center">
              Please provide a valid email and password combination!
            </p>
          </div>
        </div>
        <!-- #endregion -->
        <div
          class="col-md-6 rounded-4 left-box d-flex justify-content-center align-items-center flex-column"
        >
          <h2 class="text-center fs-1 fw-bold text-light">Login or Sign up</h2>
          <div class="featured-image mt-3 mb-3">
            <img src="../assets/Logo.png" class="img-fluid" style="width: 250px" />
          </div>
        </div>
        <!-- #region INPUTS -->
        <div class="col-md-6 right-box">
          <div class="row allign-items-center">
            <div class="input-group mb-3">
              <input
                type="email"
                placeholder="Enter Email"
                v-model="email"
                class="form-control w-100"
                required
              />
            </div>
            <div class="input-group mb-3">
              <input
                type="password"
                placeholder="Enter Password"
                v-model="password"
                class="form-control w-100"
                required
              />
            </div>
            <!-- #endregion -->
            <!-- #region BUTTONS -->
            <div class="input-group mb-3 mt-4">
              <button class="btn btn-primary w-100">Log In</button>
            </div>
            <div class="input-group mb-3 mt-1">
              <RouterLink to="/register" class="w-100">
                <button class="btn btn-primary w-100">Sign Up</button>
              </RouterLink>
            </div>
            <!-- #endregion -->
          </div>
        </div>
      </div>
    </div>
  </form>
</template>

<style scoped>
.area-form {
  width: 930px;
}

.right-box {
  padding: 40px 30px 40px 40px;
}

@media only screen and (max-width: 768px) {
  .area-form {
    margin: 0px 10px;
  }
  .right-box {
    padding: 20px;
  }
  .left-box {
    height: 100px;
    overflow: hidden;
  }
}
</style>
