<template>
  <div>
    <div>{{collection.name}}</div>
    <comic-card
      v-for="comic in $store.state.comics"
      v-bind:key="comic.id"
      v-bind:comic="comic"
    ></comic-card>
  </div>
</template>



<script>
import ComicCard from "../components/ComicCard.vue";
import collectionService from "@/services/CollectionService.js";

export default {
  props: ["collection"],

  components: {
    ComicCard,
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