<script setup>
import { Icon } from '@iconify/vue';
import axios from 'axios';
import { ref, onMounted } from 'vue';
import { useUserStore } from '@/stores/userStore.js';

const userStore = useUserStore();

let uname = ref('');
const zodiacSigns = ref([
  'Aries',
  'Taurus',
  'Gemini',
  'Cancer',
  'Leo',
  'Virgo',
  'Libra',
  'Scorpio',
  'Sagittarius',
  'Capricorn',
  'Aquarius',
  'Pisces',
]);
let selectedSign = ref('');
const selectSign = (sign) => (selectedSign.value = sign);

let predict = ref('');
let dateRange = ref('');
let cSign = ref('');
let lNumber = ref('');
let lColor = ref('');
let lDay = ref('');

onMounted(async () => {
  const { user_id, username } = userStore.user;
  if (user_id != null) {
    uname.value = username;
  }
});
const getHoroscope = async () => {
  try {
    const { data } = await axios.get(`/ustrology/horoscopes?sign=${selectedSign.value}`);
    const { prediction, date_range, sign, lucky_number, lucky_color, lucky_day } = data[0];
    predict.value = prediction;
    dateRange.value = date_range;
    cSign.value = sign;
    lNumber.value = lucky_number;
    lColor.value = lucky_color;
    lDay.value = lucky_day;
  } catch (error) {
    console.log(error);
  }
};
const clearHoroscope = () => {
  predict.value = '';
  dateRange.value = '';
  cSign.value = '';
  lNumber.value = '';
  lColor.value = '';
  lDay.value = '';
};
</script>

<template>
  <!-- #region SIDENAV-->
  <div class="sidenav">
    <a href="#home" class="w-50">
      <Icon icon="ant-design:home-outlined" width="75" />
      <p class="text-center">Home</p>
    </a>
    <a href="#astro" class="w-50 mt-5">
      <Icon icon="material-symbols:star-outline" width="75" />
      <p class="text-center">Daily Astrology</p>
    </a>
    <a href="#why" class="w-50 mt-5">
      <Icon icon="healthicons:question-outline" width="75" />
      <p class="text-center">Why Astrology</p>
    </a>
    <a href="#about" class="w-50 mt-5">
      <Icon icon="gg:profile" width="75" />
      <p class="text-center">About us</p>
    </a>
  </div>
  <!-- #endregion -->

  <div class="main" style="margin-left: 140px">
    <!-- #region LOGO&ACCOUNT -->
    <img
      src="../assets/Logo.png"
      width="100"
      id="home"
      style="position: absolute; right: 1rem; margin-top: 1rem"
    />
    <RouterLink to="/account" class="w-100">
      <Icon
        icon="gg:profile"
        width="60"
        class="text-white"
        style="position: absolute; right: 2.3rem; margin-top: 8rem"
      />
    </RouterLink>
    <!-- #endregion -->

    <div class="d-flex flex-column justify-content-center ps-1">
      <div class="w-100 text-center">
        <h1 class="text-light mt-4" style="font-size: 50px">Welcome to µStrology</h1>
      </div>
      <img src="/images/Taurus.png" class="mx-auto mt-3" alt="" width="400" />
      <hr class="text-white w-50 mx-auto mt-5" style="border-width: 2px" />
      <h3 class="text-light text-center mb-5">We've been expecting you, {{ uname }}</h3>

      <!-- #region HOROSCOPE OUTPUT -->
      <div class="d-flex justify-content-between container mb-5 mt-5" id="astro">
        <div class="flex-column w-50">
          <h2 class="text-light">Here is your Horoscope:</h2>
          <p v-if="predict == ''" class="text-light fs-5">No Horoscope yet!</p>
          <div v-else id="output" class="text-light fs-5">
            <p>{{ predict }}</p>
            <p>Lucky Number: {{ lNumber }}</p>
            <p>Lucky Colour: {{ lColor }}</p>
            <p>Lucky Day: {{ lDay }}</p>
            <p>Date Range for {{ cSign }}: {{ dateRange }}</p>
          </div>
        </div>
        <!-- #endregion -->
        <div class="d-flex flex-column">
          <h2 class="text-light">Choose your Astrology</h2>
          <!-- #region DROPDOWN -->
          <div class="dropdown d-flex justify-content-around mt-1">
            <button
              class="btn btn-outline-light dropdown-toggle"
              type="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              {{ selectedSign || 'Dropdown button' }}
            </button>
            <ul class="dropdown-menu">
              <li
                v-for="(sign, index) in zodiacSigns"
                :key="index"
                class="dropdown-item"
                @click="selectSign(sign)"
              >
                {{ sign }}
              </li>
            </ul>
            <!-- #endregion -->
            <!-- #region RADIOBUTTONS -->
            <div class="inp flex-column">
              <input type="radio" id="heute" name="astro" value="today" checked />
              <label for="heute" class="text-light ms-2">Today</label> <br />
              <input type="radio" id="morgen" name="astro" value="tomorrow" />
              <label for="morgen" class="text-light ms-2">Tomorrow</label>
            </div>
            <!-- #endregion -->
          </div>
          <a class="btn btn-outline-light w-50 align-self-center mt-3" @click="getHoroscope"
            >calculate Horoscope</a
          >
          <a
            v-if="predict != ''"
            class="btn btn-outline-danger w-50 align-self-center mt-3"
            @click="clearHoroscope"
            >clear Horoscope</a
          >
        </div>
      </div>

      <div class="container mt-5 text-center w-75" id="why">
        <h2 class="text-light">Why we chose Astrology</h2>
        <span class="text-light fs-5">
          We as a group of students from HTL Wien West were fascinated, about the rate of believers
          in astrology and wanted to help those believers. Nowadays not so many believe in
          astrology, nevertheless we want to offer those who are interested in astrology, a
          possibility to deal with the subject better with an online solution to better deal with
          the subject. We are highly interested and enthusiastic about astrology. Our hearts burn
          for the cosmos and the vastness of understanding.
        </span>
      </div>
    </div>
    <div class="mt-5 align-self-center justify-content-center d-flex" id="about">
      <div class="card me-5 bg-transparent" style="width: 18rem">
        <img src="/images/Amgad.png" class="card-img-top rounded-circle img-thumbnail" />
        <div class="card-body text-white">
          <h5 class="card-title text-center">Amgad Darwish</h5>
          <p class="card-text text-center">
            I am Amgad Darwish. My birthday is 10/21/2003. That makes me a Libra. I am responsible
            for designing the website and logo.
          </p>
        </div>
      </div>
      <div class="card ms-5 bg-transparent" style="width: 18rem">
        <img src="/images/Andras.png" class="card-img-top rounded-circle img-thumbnail" />
        <div class="card-body text-white">
          <h5 class="card-title text-center">Andras Marro</h5>
          <p class="card-text text-center">
            My name is Andras Marro. I am a Taurus because I was born on 05/04/2004. I am
            responsible for the functionality of the website.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
body {
  font-family: 'Lato', sans-serif;
}

.sidenav {
  height: 100%;
  width: 140px;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.sidenav a {
  text-decoration: none;
  font-size: 17px;
  color: #818181;
  display: block;
  text-align: center;
}

.sidenav a:hover {
  color: #f1f1f1;
}

@media screen and (max-height: 450px) {
  .sidenav {
    padding-top: 15px;
  }
  .sidenav a {
    font-size: 18px;
  }
}

.main .inp input {
  appearance: none;

  border-radius: 50%;
  width: 16px;
  height: 16px;

  border: 2px solid #999;
  transition: 0.2s all linear;
  margin-right: 5px;

  position: relative;
  top: 4px;
}
.main .inp input:checked {
  border: 6px solid white;
}
</style>
