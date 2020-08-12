<template>
  <b-col>

    <div>
      <button
        type="button"
        class="btn btn-primary"
        v-if="$store.state.token != '' && 
        this.$store.state.user.id == collection.userId"
        v-on:click="showForm = !showForm">
        <span v-show="showForm">Hide Form</span>
        <span v-show="!showForm">Add via UPC with Marvel API</span>
      </button>
    </div>

    <form class="form" v-on:submit="addNewComic"  v-if="showForm">
      <div>
        <label for="upc"></label>
        <input 
        id="upc"
        name="upc"
        type="text"
        placeholder="UPC"
        v-model="newComic.upc"/>
      </div>

      <div>
        <button type="submit" class="btn btn-primary">
          Submit
        </button>
        <button type="reset" class="btn btn-danger">
          Reset
        </button>
      </div>
      


    </form>

  </b-col>

</template>

<script>
export default {
   

    name: 'upc-lookup',
    props: ["collection"],
    data() {
      return {
        showForm: false,
        newComic: {
          upc: ''
        }
      }
    },
    methods: {
      addNewComic() {

      }
    }
};
</script>

<style>
</style>