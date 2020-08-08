<template>
<div id="app">

    <!-- <div>
      <img class="background" src="@/assets/baw-comic.jpg" alt="Series of Comic Books">
      
    </div> -->

   

    <b-container>
      <b-row>
        <nav-bar></nav-bar>
      </b-row>
      <b-row>
        <b-col cols="3" class="mt-5">
            <div id="nav" class="sidebar">
                <div>
                  <router-link v-bind:to="{ name: 'home' }">Home</router-link> <br>
                </div>
                <div v-if="$store.state.token != ''">
                  <router-link  v-bind:to="{ name: 'upgrade' }">Upgrade</router-link> <br>
                </div>
                <div>
                  <router-link v-bind:to="{ name: 'collections' }">Collections</router-link> <br>
                </div>
                <div>
                  <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
                </div>
                <div>
                  <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token === ''">Login</router-link>
                </div>
                <div>
                  <router-link v-bind:to="{path: `/collections/user/${username}`}" v-if="$store.state.token !=''">Profile</router-link>
                </div>
            </div>
        </b-col>

        <b-col class="mt-5">
          <div class="content">
            <router-view />
          </div>
        </b-col>
      </b-row>
    </b-container>

   

    

</div>
</template>

<script>

import NavBar from '@/components/NavBar'
  
  export default {
    name: 'app',
    components: {
      NavBar},
    computed: {
      username() {
        return this.$store.state.user.username
      }
    }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Bangers&display=swap');


#app {
  background-image: url("./assets/baw-comic-light.jpg");
  background-size: cover;
  height: 100vh;
}

#nav {
  grid-area: navbar;
  background-color: #236581;
  border: solid 2px black;
  border-radius: 10px;
  
}


#nav a {
  text-decoration: none;
  color: seashell;
  margin: 10px;
  opacity: .5;

}

a.router-link-exact-active {
  opacity: 1;
}

/* img {
  position: absolute;
  
  left: 0px;
  top: 0px;
  opacity: 0.4;
  z-index: -1;
} */


</style>

