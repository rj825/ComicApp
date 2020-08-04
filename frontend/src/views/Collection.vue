<template>
  <div>Put Collections Here Dude</div>
</template>

<script>
import collectionService from '../services/CollectionService'
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
   }
    
}
</script>

<style>

</style>