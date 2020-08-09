<template>
    <div class="comic">
        <div>
            {{comic}}
        </div>
        <img src="@/assets/sample-comic-cover.png" height="150px"/>
      
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