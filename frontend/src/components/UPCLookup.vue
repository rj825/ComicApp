<template>
  <div>
    <div>
      <button
        type="button"
        class="btn btn-primary"
        v-if="$store.state.token != '' && this.$store.state.user.id == collection.userId"
        v-on:click="showForm = !showForm"
      >
        <span v-show="showForm">Hide Form</span>
        <span v-show="!showForm">Add via UPC with Marvel API</span>
      </button>
    </div>

    <form class="form" v-on:submit.prevent="" v-if="showForm">
      <div>
        <label for="UPC"></label>
        <input
          id="UPC"
          name="UPC"
          type="text"
          placeholder="UPC"
          v-model="newComic.title"
          required
        />
      </div>
      <div>
        <button type="submit">Submit</button>
      </div>

      <div>
        <button type="reset" v-on:click="resetForm">Reset Form</button>
      </div>
    </form>
  </div>
</template>

<script>
export default {
   

    name: 'upc-lookup'
};
</script>

<style>
</style>