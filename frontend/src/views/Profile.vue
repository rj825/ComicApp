<template>


  <div>
      <div>
          Your User Name Is {{$store.state.user.username}}
      </div>
            <collection-card v-for="collection in $store.state.collections"
            v-bind:key="collection.id"
            v-bind:collection="collection">   
            </collection-card>
  </div>
</template>

<script>
import CollectionCard from '@/components/CollectionCard'
import CollectionService from '../services/CollectionService'


export default {
    name: "profile",
    created(){
        this.retrieveMyCollections(this.$store.state.user.username)
    },
methods: {
retrieveMyCollections(username){
    CollectionService.myCollections(username).then(response=> {
        this.$store.commit("SET_COLLECTIONS", response.data)
    } );
}
},

components:{
    CollectionCard
}
}
</script>

<style>

</style>     