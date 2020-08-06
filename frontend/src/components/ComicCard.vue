<template>
    <div class="comic">
        <div>
            {{comic}}
        </div>
        <div>
            {{comic.issue}}
        </div>
      
    </div>
</template>

<script>

export default {
    name: 'comic-card',
    props: ['comic'],
    data(){
        return {
            
            
            
        }
    }
}
</script>

<style>

</style>