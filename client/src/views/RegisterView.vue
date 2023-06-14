<script setup>
import { ref, computed } from 'vue';
import axios from 'axios';

let uname = ref('John');
let email = ref('john@gmail.com');
let password = ref('1234');
let message = ref('');
let successMessage = computed(() => message.value.includes('Congratulations'));

const register = async () => {
  try {
    const { data } = await axios.post('/auth/register', {
      username: uname.value,
      email: email.value,
      password: password.value,
    });
    message.value = data;
  } catch (error) {
    const { data } = error.response;
    if (error.response.status === 400) message.value = data.join(' ');
    else message.value = data;
  }
};
</script>

<template>
  <form @submit.prevent="register">
    <div class="form-bg d-flex justify-content-center align-items-center min-vh-100">
      <div class="row border rounded-5 p-3 bg-dark shadow area-form">
        <div v-if="message.length > 0" class="row justify-content-center">
          <div class="col-auto">
            <p v-if="successMessage" class="alert alert-success text-center">
              {{ message }}
            </p>
            <p v-else class="alert alert-danger text-center">
              {{ message }}
            </p>
          </div>
        </div>
        <div
          class="col-md-6 rounded-4 left-box d-flex justify-content-center align-items-center flex-column"
        >
          <h2 class="text-center fs-1 fw-bold text-light">Signing up...</h2>
          <div class="featured-image mt-3 mb-3">
            <img src="../assets/Logo.png" class="img-fluid" style="width: 250px" />
          </div>
        </div>
        <div class="col-md-6 right-box">
          <div class="row allign-items-center">
            <div class="input-group mb-3">
              <input
                type="text"
                v-model="uname"
                placeholder="Enter Username"
                class="form-control w-100"
                required
              />
            </div>
            <div class="input-group mb-3">
              <input
                type="text"
                v-model="email"
                placeholder="Enter E-Mail"
                class="form-control w-100"
                required
              />
            </div>
            <div class="input-group mb-3">
              <input
                type="password"
                v-model="password"
                placeholder="Enter Password"
                class="form-control w-100"
                required
              />
            </div>
            <div class="input-group mb-3">
              <button class="btn btn-primary mt-3 w-100">Sign Up</button>
            </div>
            <div class="input-group mb-3">
              <RouterLink to="/" class="w-100">
                <button class="btn btn-primary mt-1 w-100">Go Back</button>
              </RouterLink>
            </div>
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
