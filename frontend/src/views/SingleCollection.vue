<template>
  <div>
    
    <b-container>
      <div class="bangers">{{collection.name}}</div>
      <b-row>
        <add-comic-form v-if="limitNotHit" v-bind:collection="collection"></add-comic-form>
        <div v-if="!limitNotHit"> Upgrade to Premium to add more comics!</div>
      </b-row>
      <b-row class="slide-right">  
      <comic-card
        v-for="comic in $store.state.comics"
        v-bind:key="comic.comicId"
        v-bind:comic="comic"
        v-bind:collection="collection"
      ></comic-card>
      </b-row>
      <div class="slide-left">
      <b-row align-h="center">
        Number of comics written by Alan Moore in this collection is: {{$store.state.authorStat}} <br/>
        Number of comics drawn by Declan Shalvey in this collection is: {{$store.state.artistStat}}
      </b-row>
     </div> 
      
    </b-container>



    
    


  </div>
</template>



<script>
import ComicCard from "../components/ComicCard.vue";
import collectionService from "@/services/CollectionService.js";
import addComicForm from "../components/AddComicForm.vue";

export default {
  props: ["collection"],

  data() {
    return {
      author: 'Alan Moore',
      artist: 'Declan Shalvey'
      
    }
  },
  components: {
    ComicCard,
    addComicForm
  },
  created() {
    this.retrieveComics();
    this.getArtistStat();
    this.getAuthorStat();
  },
  computed: {
    limitNotHit() {
      let premiumBoolean = (this.$store.state.user.authorities[0].name === "ROLE_PREMIUM")
      let count = 0;
      this.$store.state.comics.forEach(() => {
        count+=1;
      });

      return (premiumBoolean || (count < 5))
    }

  },
  methods: {
    retrieveComics() {
      collectionService
        .singleCollection(this.$route.params.id)
        .then((response) => {
          this.$store.commit("SET_COMICS", response.data);
        });
    },
    getArtistStat() {
        let newArtist = this.artist.replace(/ /g,'-');
        collectionService.singleCollectionArtistStats(this.collection.collectionId, newArtist).then((response) => {
            this.$store.commit("SET_ARTIST_STAT", response.data);
        });
    },
    getAuthorStat() {
        let newAuthor = this.author.replace(/ /g,'-');
        collectionService.singleCollectionAuthorStats(this.collection.collectionId, newAuthor).then((response) => {
            this.$store.commit("SET_AUTHOR_STAT", response.data);
        });
    }
  },
};
</script>




<style>
.bangers{
  font: 2em bangers;
  text-align: center;
}

 .slide-left{
  animation-duration: 2s;
  animation-name: slide-left;
  font: 1.3em bangers;
}

@keyframes slide-left {
  from {
    margin-left: 100%;
    width: 300%; 
  }

  to {
    margin-left: 0%;
    width: 100%;
  }
}
 .slide-right{
  animation-duration: 1s;
  animation-name: slide-right;
  font: 1em bangers;
}


  @keyframes slide-right {
  from {
    margin-left: -100%;
    width: 300%; 
  }

  to {
    margin-left: 0%;
    width: 100%;
  }
}
</style>