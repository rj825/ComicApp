<template>
    <div>
        Add collection button to pop out form and list of collections goes here
        <add-collection></add-collection>
        <collection-card v-for="collection in $store.state.collections" 
        v-bind:key="collection.id"
        v-bind:collection="collection">
        
        </collection-card>
    </div>
    
</template>

<script>
import collectionService from '../services/CollectionService';
import AddCollection from '@/components/AddCollection'
import CollectionCard from '@/components/CollectionCard'

export default {
    data(){
        return {

            

        }
    },//Need to implement data for collections. 
    created(){
        this.retrieveCollections()
    },
    methods:{
       retrieveCollections(){
            collectionService.allCollections().then(response => {
            this.$store.commit("SET_COLLECTIONS", response.data)
       });
       }
   },
   components: {
       AddCollection,
       CollectionCard
   }
    
}
</script>

<style>

</style>