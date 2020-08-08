<template>
  <div class="home">

    

    <b-container>
      <b-row>
        <b-col>
          
        </b-col>
      </b-row>
    </b-container>

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

  
}



.welcome-message {
  
  background: rgb(255, 215, 36);
  border: solid 2px black;
  border-radius: 10px;
  grid-area: message;
  text-align: center;
  max-width: 300px;
  max-height: 150px;
  margin: auto;
 
}





</style>
