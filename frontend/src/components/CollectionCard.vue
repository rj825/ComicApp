<template>
    <div class="whole-collection">
        <router-link
            :to="{name: 'collection-detail' , params: {id: collection.id, collection:collection}}">
        <div>
            {{collection.name}}
        </div>
        <div>
            {{collection.id}}
        </div>
        <div>
            {{collection.userID}}
        </div>
        </router-link>

    </div>
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
    background-color: firebrick;
    font-color: seashell;
}

</style>