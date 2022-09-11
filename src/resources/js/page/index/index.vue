<template>
    <div>
        <MainCarousel />
        <MiddleCarousel />
        <MiddleDecoration />
        <MiddleIntroduce />
    </div>
</template>
<script>
import MainCarousel from './MainCarousel.vue';
import MiddleCarousel from './MiddleCarousel.vue';
import MiddleDecoration from './MiddleDecoration.vue';
import MiddleIntroduce from './MiddleSearch.vue';
export default {
    components: {
        MainCarousel,
        MiddleCarousel,
        MiddleDecoration,
        MiddleIntroduce,
    }
}
</script>
<style scoped>
    
</style>