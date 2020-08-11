<template>
  <div>

    <b-container>
      Number of comics written by Alan Moore in this collection is: {{$store.state.authorStat}} <br/>
      Number of comics drawn by Declan Shalvey in this collection is: {{$store.state.artistStat}}
      <b-row>
        <add-comic-form v-bind:collection="collection"></add-comic-form>
      </b-row>
      <b-row>
        
      <comic-card
        v-for="comic in $store.state.comics"
        v-bind:key="comic.comicId"
        v-bind:comic="comic"
      ></comic-card>

      </b-row>
    </b-container>



    <div>{{collection.name}}</div>
    


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
  methods: {
    retrieveComics() {
      collectionService
        .singleCollection(this.collection.collectionId)
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
</style>