<template>
  <div class="home">

    <div>
      <img class="background" src="../assets/baw-comic.jpg" alt="Series of Comic Books">
    </div>

    <div class="header">
    </div>

    <div class="welcome-message">
      <h1>Welcome to Three-Point!</h1>
      <p wrap="hard">The ultimate site to log and share your comic collections! </p>
    </div>

  </div>
</template>

<script>

export default {
  name: 'home'
};
</script>

<style>

.home {
  display: grid;
  height: 100%;
  width: 100%;
  grid-template-columns: 1fr, 1fr, 1fr;
  grid-template-rows: 1fr, 1fr, 1fr;
  grid-template-areas: 
  "header header header"
  ". message ."
  ". . .";
}

img {
  position: absolute;
  width: 100vw;
  height: 100vh;
  left: 0px;
  top: 0px;
  opacity: 0.3;
  z-index: -1;
}

.welcome-message {
  
  background: rgb(255, 215, 36);
  border: solid 2px black;
  border-radius: 10px;
  grid-area: message;
  text-align: center;
}

.header {
grid-area: header;

}



</style>
