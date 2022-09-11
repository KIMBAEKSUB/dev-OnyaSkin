<template>
    <div class="window_container">
        <div class="space_03"></div>
        <div class="px_20"><router-link to="/">home</router-link> - best</div>
        <div class="fs_title_01 fw_800 px_20">
            Best
        </div>
        <div class="best_item_wrap">
            <div class="d_inline_block" v-for="(product, key) in products" :key="key">
                <div class="best_item">
                    <router-link :to="'/product/' + product.product_id + '/detail'" class="best_item">
                        <div class="img_wrap_01">
                            <img class="w_100" :src="'/server/img/prod/' + product.product_code + '/get'">
                        </div>
                        <div class="fw_500 fc_gray_04">
                            {{product.product_name}}
                        </div>
                        <div class="fc_gray_05">
                            {{product.product_price.replace('?', '')}}
                        </div>
                    </router-link>
                    <div class="py_15 fc_gray_05 fs_plain">
                        <a @click="increaseHeart">
                            <span class="material-icons fs_plain heart_icon">favorite_border</span>
                            <span>{{product.product_heart_count}}</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="space_03"></div>
    </div>
</template>
<script>
import axios from '../../axios/index';
export default {
    data() {
        return {
            imageCount: 15,
            products: {},
        }
    },
    mounted () {
        this.getMiddleCarouselItems();
    },
    methods: {
        getMiddleCarouselItems() {
            const url = `/img/prod/best/${this.imageCount}/get`;
            axios.get(url).then(res => {
                if(res.status === 200)
                this.products = res.data;
            }).catch(err => {
                console.log(err);
            })
        },
        increaseHeart() {
            alert('increaseHeart');
        }
    },
}
</script>
<style scoped>
.best_item {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.heart_icon {
    transform: translate(-30%, 10%);
}
</style>