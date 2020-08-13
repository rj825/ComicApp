<template>
  <div class="home">

    

    <b-container>
      <b-row>
        <b-col>

          <carousel-slide></carousel-slide>

        </b-col>
        
        
      </b-row>
    </b-container>

    

    

  </div>
</template>

<script>
import CarouselSlide from '../components/CarouselSlide.vue';


export default {
  components: {
    CarouselSlide
  },
  name: 'home'
};
</script>

<style>


.home {
  font-family: 'Bangers';
  
}

p {
  font-size: 3vw;
}

.headline {
  font-size: 5vw;
}

.welcome-message {
  
  background: #FCFC62;
  border: solid 2.5px black;
  border-radius: 10px;
  text-align: center;
  margin: auto;
 
}





</style>
