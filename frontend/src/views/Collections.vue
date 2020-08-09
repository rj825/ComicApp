<template>
    <div class="collections">

        <b-container>
            
            <b-row>
                <b-col>
                    <add-collection></add-collection>
                </b-col>
            </b-row>

            <b-row>
                <collection-card
            class="collection-card"  
            v-for="collection in $store.state.collections" 
            v-bind:key="collection.id"
            v-bind:collection="collection">
            </collection-card>
            </b-row>
        </b-container>
        <div>
            
            
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






</style>