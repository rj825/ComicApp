<template>
  <div class="collections">
    
    <b-container>
      
      <b-row align-h="center">
        Number of comics written by Alan Moore in all public collections is: {{$store.state.authorStat}} <br/>
        Number of comics drawn by Declan Shalvey in all public collections is: {{$store.state.artistStat}}
      </b-row>
        
        <hr>
      
      <b-row>
        <collection-card
          class="collection-card"
          v-for="collection in $store.state.collections"
          v-bind:key="collection.id"
          v-bind:collection="collection"
        ></collection-card>
      </b-row>

    </b-container>
    

  </div>
</template>

<script>
import collectionService from "../services/CollectionService";
// import AddCollection from '@/components/AddCollection'
import CollectionCard from "@/components/CollectionCard";

export default {
  data() {
    return {
        artist: 'Declan Shalvey',
        author: 'Alan Moore'
    };
  }, //Need to implement data for collections.
  created() {
    this.retrieveCollections();
    this.getArtistStat();
    this.getAuthorStat();
  },
  methods: {
    retrieveCollections() {
      collectionService.allCollections().then((response) => {
        this.$store.commit("SET_COLLECTIONS", response.data);
      });
    },
    seeCollectionDetails(collectionID) {
      this.$router.push({
        name: "collection-detail",
        params: { id: collectionID },
      });
    },
    getArtistStat() {
        let newArtist = this.artist.replace(/ /g,'-');
        collectionService.allCollectionsArtistStats(newArtist).then((response) => {
            this.$store.commit("SET_ARTIST_STAT", response.data);
        });
    },
    getAuthorStat() {
        let newAuthor = this.author.replace(/ /g,'-');
        collectionService.allCollectionsAuthorStats(newAuthor).then((response) => {
            this.$store.commit("SET_AUTHOR_STAT", response.data);
        });
    }
  },
  components: {
    //    AddCollection,
    CollectionCard,
  },
};
</script>

<style>
</style>