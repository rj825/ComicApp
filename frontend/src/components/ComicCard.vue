<template>
    
        <b-col cols="3" no-body="true" class="whole-comic">

            <b-card
            v-if="frontFacing"
            v-on:click="flipCard"
            img-src="@/assets/sample-comic-cover.png">
            {{comic.title}}
            {{comic.issue}}
            </b-card>

            <b-card
            v-if="!frontFacing"
            v-on:click="flipCard"
            img-src="@/assets/sample-comic-cover.png">
            Stats Side
            </b-card>

            <br>


        </b-col>
        
    
</template>

<script>

export default {
    name: 'comic-card',
    props: ['comic'],
    data(){
        return {
            frontFacing: true
            
            
        }
    },
    methods: {
        flipCard() {
            this.frontFacing = !this.frontFacing
        }
    }
}
</script>

<style>

.whole-comic {
    text-decoration: none;
    font-family: "Bangers";
    font-size: 2vw;
    
    
}






</style>