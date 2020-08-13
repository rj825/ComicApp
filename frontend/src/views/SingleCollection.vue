<template>
  <div>
    
    <b-container>
      
        <b-row align-v="center">
          <b-col class="header-text">
            <div class="header">
              {{collection[0].name}}
            </div>
           <div class="sub-header">
            Click on Comics to see their stats!
           </div>
           
          </b-col>

          <b-col cols="4">
            <add-comic-form 
            v-if="limitNotHit" 
            v-bind:collection="collection[0]">
            </add-comic-form>
            <br>
            <div class="makethisred" v-if="!limitNotHit"> Upgrade to Premium to have more than 5 comics in a collection!</div>
            
           
              <u-p-c-lookup 
              v-if="limitNotHit" 
              v-bind:collection="collection[0]">
              </u-p-c-lookup>
            
            

            
          </b-col>

        </b-row>

        <hr>

      <b-row class="slide-right">  
        <comic-card
          v-for="comic in $store.state.comics"
          v-bind:key="comic.comicId"
          v-bind:comic="comic"
          v-bind:collection="collection[0]"
          v-bind:showDeleteButton="showDeleteButton"
        ></comic-card>
      </b-row>

      

      <div class="slide-left">
        <b-row align-h="center">
          Your most popular Author is {{mostPopular.author}} with {{mostPopular.authorIssues}} comics in your collection <br>
          Your most popular Artist is {{mostPopular.artist}} with {{mostPopular.artistIssues}} comics in your collection <br>
          Your most popular Character is {{mostPopular.character}} with {{mostPopular.characterIssues}} comics in your collection
        </b-row>
     </div> 
      
    </b-container>

  </div>
</template>



<script>
import ComicCard from "../components/ComicCard.vue";
import collectionService from "@/services/CollectionService.js";
import addComicForm from "../components/AddComicForm.vue";
import UPCLookup from "../components/UPCLookup.vue";

export default {
  

  data() {
    return {
      collection: '',
      mostPopular: {
          author: 'Jacob Wood',
          authorIssues: 20,
          artist: 'Randy Proctor',
          artistIssues: 40,
          character: 'Brandon Moore',
          characterIssues: 60
    }
      
    }
  },
  components: {
    ComicCard,
    addComicForm,
    UPCLookup
  },
  created() {
    this.loadCollectionsIntoStore();
    
    this.retrieveComics();
    
    
  },
  computed: {
    limitNotHit() {
      let premiumBoolean = (this.$store.state.user.authorities && this.$store.state.user.authorities[0].name === "ROLE_PREMIUM")
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
        return collection.collectionId == id;
      }) 
    },
    loadCollectionsIntoStore() {
      collectionService
      // NOTE TO REVIEWER: the 'allCollections' method would ideally be a different service that 
      // found a specific collection by name.  Due to time restrictions before demo we have decided
      // to load them all.  We know that this is not how we would scale up if this were an actual
      // live product
        .allCollections()
        .then((response) => {
          this.$store.commit("SET_COLLECTIONS", response.data);
          this.getCollection(this.$route.params.id);
          this.getArtistStat();
          this.getAuthorStat();
        });
    }
    
  },
};
</script>




<style>
.header-text {
  font-family: "Bangers";
}

.header {
  font-size: 5vw;
}

.sub-header{
  font-size: 2vw;
}

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
  .makethisred{
    color: firebrick;
  }
</style>