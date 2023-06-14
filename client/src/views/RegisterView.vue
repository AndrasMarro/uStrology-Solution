<template>
  <div class="form-bg d-flex justify-content-center align-items-center min-vh-100">
    <div class="row border rounded-5 p-3 bg-dark shadow area-form">
      <div class="col-md-6 rounded-4 left-box d-flex justify-content-center align-items-center flex-column">
    <h2 class="text-center fs-1 fw-bold text-light">Signing up...</h2>
    <div class="featured-image mt-3 mb-3">
          <img src="../assets/Logo.png" class="img-fluid" style="width: 250px" />
        </div>
      </div>
      <div class="col-md-6 right-box">
        <div class="row allign-items-center ">
        <div class="input-group mb-3">
          <input type="text" v-model="uname" placeholder="Enter Username" class="form-control w-100" />
        </div>
        <div class="input-group mb-3">
                  <input type="text" v-model="email" placeholder="Enter E-Mail" class="form-control w-100" />
        </div>
        <div class="input-group mb-3">
          <input type="password" v-model="passwort" placeholder="Enter Password" class="form-control w-100" />
        </div>
          <div class="input-group mb-3">
          <RouterLink to="/home" class="w-100">
            <button @click="add" class="btn btn-primary mt-3 w-100">Sign Up</button>
          </RouterLink>
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
</template>
<script setup>
import { ref } from 'vue';
import axios from 'axios';

let uname = ref('');
let passwort = ref('');
let email = ref('');

const add = async () => {
  await axios.post('http://localhost:3000/auth/register', {
    name: uname.value,
    password: passwort.value,
    mail: email.value,
  })};
</script>
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
