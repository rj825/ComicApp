<template>
<div id="app">
 

    <b-container>

      
          <nav-bar></nav-bar>
        
      
      <b-row>
        <!-- <b-col cols="3" class="mt-5">
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
        </b-col> -->

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

body, html {
  display: inline-block;
  width: 100%;
  height: auto;
  vertical-align: middle;
  background-image: url("./assets/baw-comic-light.jpg");
   background-position: 50% 50%;
   background-repeat: no-repeat;
   background-size: cover;
}


#app {
  background-image: url("./assets/baw-comic-light.jpg");
  background-size: cover;
  background-position: top;
  height: 100vh;
}

/* PALETTE COLORS PLEASE PICK FROM THESE
https://coolors.co/b22222-236581-5bc0de-ffff66-402039 */


/* #nav {
  grid-area: navbar;
  background-color: #236581;
  border: solid 2px black;
  border-radius: 10px;
  
} */





</style>

