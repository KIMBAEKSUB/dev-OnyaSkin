<template>
    <div class="window_container space_06">
        <div class="fc_gray_04 space_01">
            <div class="px_20"><router-link to="/">Home</router-link> — <router-link to="/shop/skincare">Online Shop</router-link> — {{pageName}}</div>
            <div class="fs_title_01 fc_gray_03 fw_600 px_20">{{pageName}}</div>
        </div>
        <ShopNav 
            :prodKbn="prodKbn"
        />
        <ProductList
            :prodKbn="prodKbn"
        />
    </div>
</template>
<script>
import ShopNav from './ShopNav.vue';
import ProductList from './ProductList.vue';
export default {
    props: {
        pageName: {
            type: String,
            require: true,
        },
        prodKbn: {
            type: Number,
            require: true,
        }
    },
    components: {
        ShopNav,
        ProductList
    },
}
</script>
<style scoped>
    
</style>