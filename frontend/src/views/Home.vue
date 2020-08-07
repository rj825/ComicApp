<template>
  <div class="home">

    

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
  font-family: 'Bangers';
  display: grid;
  height: 90vh;
  width: 100%;
  grid-template-columns: 1fr, 1fr, 1fr;
  grid-template-rows: 1fr, 1fr, 1fr;
  grid-template-areas: 
  "header header header"
  ". message ."
  ". . .";
}



.welcome-message {
  
  background: rgb(255, 215, 36);
  border: solid 2px black;
  border-radius: 10px;
  grid-area: message;
  text-align: center;
  max-width: 300px;
  max-height: 150px;
}

.header {
grid-area: header;

}



</style>
