<template>
  <div>
    <button v-on:click="showForm = !showForm">
      <span v-show="showForm">Hide Form</span>
      <span v-show="!showForm">Add Collection</span>
    </button>
    <form v-on:submit.prevent="addNewCollection" v-if="showForm">
      <label for="collectionName">Collection Name:</label>
      <br />
      <input
        id="collectionName"
        name="collectionName"
        type="text"
        placeholder="Collection Name Here (50 characters max)"
        v-model="newCollection.name"
      />
      <label>Check to make collection public</label>
      <input id="isPublic" name="isPublic" type="checkbox" v-model="newCollection.isPublic" />
      <button type="submit">Submit</button>
      <button type="reset" v-on:click="resetForm">Reset Form</button>
    </form>
  </div>
</template>

<script>
import collectionService from "../services/CollectionService";
export default {
  name: "add-collection",
  data() {
    return {
      newCollection: {
        name: "",
        isPublic: false,
      },
      showForm: false,
    };
  },
  methods: {
    resetForm() {
      this.newCollection = {};
    },
    addNewCollection() {
      collectionService
        .createCollection(this.newCollection.name, this.newCollection.isPublic)
        .then((response) => {
          if (response.status === 201) {
            this.$router.push("/collections");
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
          " card. Response received was '" +
          error.response.statusText +
          "'.";
      } else if (error.request) {
        this.errorMsg = "Error " + verb + " card. Server could not be reached.";
      } else {
        this.errorMsg =
          "Error " + verb + " card. Request could not be created.";
      }
    },
  },
};
</script>

<style>
</style>