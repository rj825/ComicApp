<template>


  <div>
      <div>
          Your User Name Is {{$store.state.user.username}}
      </div>
            <collection-card v-for="collection in $store.state.collections"
            v-bind:key="collection.id"
            v-bind:collection="collection">   
            </collection-card>
            <b-row>
                <b-col>
                    <add-collection></add-collection>
                </b-col>
            </b-row>
  </div>
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