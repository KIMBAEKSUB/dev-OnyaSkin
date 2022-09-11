<template>
    <div class="space_01 px_20">
        <router-link to="skincare"><button class="button_04" :class="{'button_05': skincare == prodKbn}" >SKIN CARE</button></router-link>
        <router-link to="makeup"><button class="button_04" :class="{'button_05': makeup == prodKbn}" >MAKE UP</button></router-link>
        <router-link to="bodyhair"><button class="button_04" :class="{'button_05': bodyhair == prodKbn}" >BODY & HAIR</button></router-link>
        <router-link to="accessories"><button class="button_04" :class="{'button_05': accessories == prodKbn}" >ACCESSORIES</button></router-link>
        <router-link to="nails"><button class="button_04" :class="{'button_05': nails == prodKbn}" >NAILS</button></router-link>
    </div>
</template>
<script>
export default {
    props: {
        prodKbn: {
            type: Number,
            require: true,
        }
    },
    data() {
        return {
            skincare: 1,
            makeup: 2,
            bodyhair: 3,
            accessories: 4,
            nails: 5,
        }
    },
}
</script>
<style scoped>
    
</style>