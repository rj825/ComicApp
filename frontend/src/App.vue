<template>
<div id="app">

    <div id="nav" class="sidebar">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link> <br>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token === ''">Login</router-link>
    </div>

    <div class="content">
      <router-view />
    </div>

</div>
</template>

<style>
#app {
  display: grid;
  width: 100vw;
  height: 100vh;
  grid-template-areas: 
  "navbar router-view";
  grid-template-columns: 100px 1fr;
}

#nav {
  grid-area: navbar;
  background-color: #236581;
}
div.content {

  grid-area: router-view;
}

a {
  text-decoration: none;
  color: seashell;
  margin: 25px;
  opacity: .5;

}

a.router-link-exact-active {
  opacity: 1;
}


</style>

<!--
<style>
#app {
  display: grid;
  grid-template-columns: minmax(100px, 20%) auto;
  grid-template-rows: auto;
  height: 100vh;
}

.sidebar {
  background-color: #236581;
}

.sidebar > a {
  justify-items: ;
}

</style>
-->