<template>
    <b-col class="whole-collection">
        <router-link
            :to="{name: 'collection-detail' , params: {id: collection.collectionId, collection:collection}}">
        <div>
            {{collection.name}}
        </div>
        <div>
            {{collection.collectionId}}
        </div>
        <div>
            {{collection.userId}}
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
}

</style>