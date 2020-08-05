<template>
    <div class="whole-collection">
        <div>
            {{collection.name}}
        </div>
        <div>
            {{collection.id}}
        </div>
        <div>
            {{collection.userID}}
        </div>
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

</style>