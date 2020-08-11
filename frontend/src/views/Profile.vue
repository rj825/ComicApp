<template>


  <b-container>
      <b-row>
        {{$store.state.user.username}}'s Collection
      </b-row>
      <b-row>
        <b-col>
            <add-collection></add-collection>
        </b-col>
     </b-row>
     <b-row>
        <collection-card v-for="collection in $store.state.collections"
            v-bind:key="collection.id"
            v-bind:collection="collection">   
        </collection-card>
     </b-row>
            
            
  </b-container>
      
  
</template>

<script>
import CollectionCard from '@/components/CollectionCard'
import CollectionService from '../services/CollectionService'
import AddCollection from '@/components/AddCollection'


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
    CollectionCard,
    AddCollection
}
}
</script>

<style>

</style>     