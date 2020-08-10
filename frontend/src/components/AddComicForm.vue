<template>
 <b-col>
   <div>
      <button v-if="$store.state.token != '' && this.$store.state.user.id == collection.userId" v-on:click="showForm = !showForm">
        <span v-show="showForm">Hide Form</span>
        <span v-show="!showForm">Add Comic</span>
      </button>
    </div>
      
    <form class="form" v-on:submit="addNewComic" v-if="showForm">
      
      <div>
        <label for="comicName">Comic Title:</label>
        <input
          id="comicName"
          name="comicName"
          type="text"
          placeholder="(50 characters max)"
          v-model="newComic.title"
          required/>
      </div>

  
      <div>
        <button type="submit">Submit</button>
      </div>

      <div>
        <button type="reset" v-on:click="resetForm">Reset Form</button>
      </div>

    </form>
</b-col>
  
</template>

<script>
import ComicService from '../services/ComicService'

export default {
name: 'add-comic-form',
props: ['collection'],
data(){
    return{
        showForm: false,
        newComic:{
            title: '',
            issue: '',
            mainCharacter: '',
            author: '',
            artist: '',
            publisher: ''
        }
    }

},
methods:{
    addNewComic(){
        ComicService
        .addComic(this.$store.state.user.id, this.newComic)
        .then((response) => {if (response.status === 201) {
            this.resetForm();
          }
        })
        .catch((error) => {
          this.handleErrorResponse(error, "adding");
        });
    },
    handleErrorResponse(error, verb) {
      if (error.response) {
        this.errorMsg =
          "Error " +
          verb +
          " comic. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg = "Error " + verb + " comic. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " comic. Request could not be added.";
      }
    
    },

    resetForm(){
        this.newComic = {}
    },

}
}
</script>

<style>

</style>