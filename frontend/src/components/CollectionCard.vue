<template>
    <b-col cols="4" class="whole-collection shadow-lg">
        
        
        
            <b-card
            v-on:click="goToIndividualCollection"
            img-src="@/assets/comic-background-fade.png"
            overlay
            v-bind:title="collection.name"
            v-bind:footer="collection.collectionId"
            >
            

            
            </b-card>
        
        <!-- Collection ID: {{collection.collectionId}} <br>
            User ID: {{collection.userId}} -->
        
        <!-------OLD CODE BELOW, KEEPING AS REFERENCE AS FUNCTIONALITY------->

        <!-- <b-col>
            <router-link
                :to="{name: 'collection-detail' , params: {id: collection.collectionId, collection:collection}}">
            <div>
                {{collection.name}}
            </div>
            <div>
                Collection ID: {{collection.collectionId}}
            </div>
            <div>
                User ID: {{collection.userId}}
            </div>
            </router-link>
        </b-col> -->
        

    </b-col>
</template>

<script>

export default {
    name: 'collection-card',
    props: ['collection'],
    data(){
        return {
            
            
            
        }
    },
    methods: {
        goToIndividualCollection() {
            this.$router.push({name: 'collection-detail' , params: {id: this.collection.collectionId, collection:this.collection}});
        }
    }
}
</script>

<style>

.whole-collection {
    text-decoration: none;
    font-family: "Bangers";
    font-size: 2vw;
    cursor: pointer;
}



</style>