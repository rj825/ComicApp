<template>
    <div class="collections">
        Add collection button to pop out form and list of collections goes here
        <add-collection></add-collection>
        <div>
            <collection-card
            class="card"  
            v-for="collection in $store.state.collections" 
            v-bind:key="collection.id"
            v-bind:collection="collection">
            
            </collection-card>
            
        </div>
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
       },
       seeCollectionDetails(collectionID) {
           this.$router.push({name: 'collection-detail' , params: {id: collectionID}})
       }
   },
   components: {
       AddCollection,
       CollectionCard
   }
    
}
</script>

<style>

.collections {
    height: 90vh;
}

.card {
    display: inline-block;
    border: 25px;
    border: solid 5px black;
    border-radius: 10px;
}

</style>