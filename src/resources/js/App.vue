<template>
    <div>
        <HeaderComponent />
        <NavigationComponent />
        <router-view />
        <FooterComponent />
    </div>
</template>
<script>
import HeaderComponent from './components/HeaderComponent.vue';
import FooterComponent from './components/FooterComponent.vue';
import NavigationComponent from './components/NavigationComponent.vue';
export default {
    components: {
        HeaderComponent,
        FooterComponent,
        NavigationComponent,
    }
}
</script>