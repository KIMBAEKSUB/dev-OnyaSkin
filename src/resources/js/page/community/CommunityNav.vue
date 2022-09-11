<template>
    <div class="space_01 px_20">
        <router-link to="/community/notice"><button class="button_04" :class="{'button_05': pageName == 'Notice'}">NOTICE</button></router-link>
        <router-link to="/community/usercommunication"><button class="button_04" :class="{'button_05': pageName == 'usercommunication'}">Q&A</button></router-link>
        <router-link to="/community/event"><button class="button_04" :class="{'button_05': pageName == 'Event'}">EVENT</button></router-link>
    </div>
</template>
<script>
export default {
    props: {
        pageName: {
            type: String,
        } 
    }
}
</script>
<style scoped>
    
</style>