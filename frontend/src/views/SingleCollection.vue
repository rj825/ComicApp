<template>
  <div>

    <b-container>
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

  components: {
    ComicCard,
    addComicForm
  },
  created() {
    this.retrieveComics();
  },
  methods: {
    retrieveComics() {
      collectionService
        .singleCollection(this.collection.collectionId)
        .then((response) => {
          this.$store.commit("SET_COMICS", response.data);
        });
    },
  },
};
</script>




<style>
</style>