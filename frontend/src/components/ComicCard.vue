<template>
    
        <b-col class="whole-comic">
            <div>
                {{comic}}
            </div>
            <img src="@/assets/sample-comic-cover.png" height="150px"/>
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
    display: inline-block;
    border: 25px;
    border: solid 2.5px black;
    border-radius: 10px;
    margin: 5px;
    background-color: firebrick;
}

</style>