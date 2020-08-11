<template>
    
        <b-col cols="4" no-body="true" class="whole-comic">
            <b-card
            img-src="@/assets/sample-comic-cover.png">
            {{comic}}
            
            </b-card>

            
        </b-col>
        
    
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

.whole-comic {
    text-decoration: none;
    font-family: "Bangers";
}

</style>