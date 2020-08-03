<template>
  <div id="app">
    <div id="nav" class="sidebar">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token === ''">Login</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
#app {
  display: grid;
  grid-template-columns: 20% auto;
  grid-template-rows: auto;
  height: 100vh;
}

.sidebar {
  background-color: #236581;
}
</style>