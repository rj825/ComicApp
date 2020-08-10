<template>
 <b-col>
   <div>
      <button v-if="$store.state.token != '' && $store.state.currentUser.id == $store.state.collections.userID" v-on:click="showForm = !showForm">
        <span v-show="showForm">Hide Form</span>
        <span v-show="!showForm">Add Comic</span>
      </button>
    </div>
      
    <form class="form" v-on:submit="addNewComic" v-if="showForm">
      
      <div>
        <label for="comicName">Comic Name:</label>
        <input
          id="comicName"
          name="comicName"
          type="text"
          placeholder="(50 characters max)"
          v-model="newComic.name"
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

export default {
name: 'add-comic-form',

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
        return 
    },
    resetForm(){
        this.newComic = {}
    }
}
}
</script>

<style>

</style>