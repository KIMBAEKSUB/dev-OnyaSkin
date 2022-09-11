<template>
    <div>{{this.increment() }}</div>
</template>
<script>
    export default {
        name: 'AppHeader',
        methods: {
    increment() {
        this.$store.commit('increment')
        console.log(this.$store.state.count)
    }
    }
}
</script>