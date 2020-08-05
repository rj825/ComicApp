<template>
<div>

    <div>
        {{collection.name}}
    </div>
        <comic-card>
        </comic-card>
    

</div>
</template>



<script>
import ComicCard from '../components/ComicCard.vue'

export default {
    props: ['collection'],

    components: {
        ComicCard
    },
    created() {

    } 
}
</script>




<style>

</style>