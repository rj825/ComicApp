<template>
    
        <b-col cols="3" no-body="true" class="whole-comic">

            <b-card
            v-if="frontFacing"
            v-on:click="flipCard"
            img-src="@/assets/sample-comic-cover.png">
            {{comic.title}} <br>
            Issue #{{comic.issue}}
            </b-card>

            <b-card
            v-if="!frontFacing"
            v-on:click="flipCard"
            img-src="@/assets/sample-comic-cover.png">
            Stats Side
            </b-card>
            
            <div>
                <button type="button" class="btn btn-danger" 
                v-on:click="deleteComic()"
                v-if="$store.state.token != '' && 
                this.$store.state.user.id == collection.userId && 
                showDeleteButton">
                    Delete Comic
                </button>
            </div>
            <br>


    
  </b-col>
</template>

<script>
import CollectionService from '../services/CollectionService';
export default {
  name: "comic-card",
  props: ["comic", "collection", "showDeleteButton"],
  data() {
    return {
      frontFacing: true,
    };
  },
  methods: {
    flipCard() {
      this.frontFacing = !this.frontFacing;
    },
    deleteComic() {
        if (confirm('Are you sure?'))
            CollectionService.deleteComicFromCollection(this.collection.collectionId, this.comic.comicId)
            .then((response) => {if (response.status === 200) {
                    this.$router.go();
                }
            });
    }

  }

};
</script>

<style>
.whole-comic {
  text-decoration: none;
  font-family: "Bangers";
  font-size: 1.4vw;
}
</style>