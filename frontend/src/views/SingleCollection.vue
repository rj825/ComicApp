<template>
  <div>

    <b-container>
      <b-row align-h="center">
        Number of comics written by Alan Moore in this collection is: {{$store.state.authorStat}} <br/>
        Number of comics drawn by Declan Shalvey in this collection is: {{$store.state.artistStat}}
      </b-row>
      
      <b-row>
        <add-comic-form v-if="limitNotHit" v-bind:collection="collection[0]"></add-comic-form>
        <div v-if="!limitNotHit"> Upgrade to Premium to add more comics!</div>
      </b-row>

      <b-row>  
      <comic-card
        v-for="comic in $store.state.comics"
        v-bind:key="comic.comicId"
        v-bind:comic="comic"
        v-bind:collection="collection[0]"
      ></comic-card>
      </b-row>

    </b-container>



    <div>{{collection[0].name}}</div>
    


  </div>
</template>



<script>
import ComicCard from "../components/ComicCard.vue";
import collectionService from "@/services/CollectionService.js";
import addComicForm from "../components/AddComicForm.vue";

export default {
  

  data() {
    return {
      author: 'Alan Moore',
      artist: 'Declan Shalvey',
      collection: {}
      
    }
  },
  components: {
    ComicCard,
    addComicForm
  },
  created() {
    this.getCollection(this.$route.params.id);
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
        collectionService.singleCollectionArtistStats(this.collection[0].collectionId, newArtist).then((response) => {
            this.$store.commit("SET_ARTIST_STAT", response.data);
        });
    },
    getAuthorStat() {
        let newAuthor = this.author.replace(/ /g,'-');
        collectionService.singleCollectionAuthorStats(this.collection[0].collectionId, newAuthor).then((response) => {
            this.$store.commit("SET_AUTHOR_STAT", response.data);
        });
    },
    getCollection(id) {
      this.collection = this.$store.state.collections.filter(collection => {
        return collection.collectionId === id;
      }) 
    }
  },
};
</script>




<style>
</style>