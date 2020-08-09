<template>
    <b-col cols="2" class="whole-collection shado">
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

    </b-col>
</template>

<script>

export default {
    name: 'collection-card',
    props: ['collection'],
    data(){
        return {
            
            
            
        }
    }
}
</script>

<style>

.whole-collection {
    text-decoration: none;
    font-family: "Bangers";
    display: inline-block;
    border: 25px;
    border: solid 2.5px black;
    border-radius: 10px;
    margin: 5px;
    background-color: firebrick;
}

</style>