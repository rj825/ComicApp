<template>
    <div>
    Add collection button to pop out form and list of collections goes here
    <add-collection></add-collection>
    </div>
</template>

<script>
import collectionService from '../services/CollectionService';
import AddCollection from '@/components/AddCollection'

export default {
    data(){},//Need to implement data for collections. 
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
       AddCollection
   }
    
}
</script>

<style>

</style>