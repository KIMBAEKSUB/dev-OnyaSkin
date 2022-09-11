<template>
    <div>
        <div class="">
            <div class="d_inline_block" v-for="(product, key) in products" :key="key">
                <div class="product_list">
                    <router-link :to="'/product/' + product.product_id + '/detail'" class="product_list">
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
                        <router-link :to="'/product/' + product.product_id + '/detail'">
                            <span class="material-icons fs_plain heart_icon">chat_bubble_outline</span>
                            <span>{{product.product_heart_count}}</span>
                        </router-link>
                        <a @click="increaseHeart(product.product_id)" class="px_20">
                            <span class="material-icons fs_plain heart_icon">favorite_border</span>
                            <span>{{product.product_heart_count}}</span>
                        </a>
                        <a @click="intoCart">
                            <span class="material-icons fs_plain heart_icon">shopping_cart</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { getCurrentInstance } from 'vue'
import axios from '../../axios/index';
export default {
    props: {
        prodKbn: {
            type: Number,
            require: true,
        }
    },
    setup() {
        const internalInstance = getCurrentInstance(); 
        const emitter = internalInstance.appContext.config.globalProperties.emitter;
        const openLoginModal = () => {
            
        }

        return {openLoginModal}
    },
    watch: {
        prodKbn(val) {
            this.getProduct()
        }
    },
    data() {
        return {
            products: {},
        }
    },
    mounted() {
        this.getProduct()
    },
    methods: {
        getProduct() {
            const url = '/prod/get';
            const params = { 'prod_kbn': this.prodKbn };
            axios.post(url, params).then(res => {
                this.products = res.data;
            }).catch(err => {
                console.log(err);
            });
        },
        increaseHeart(productId) {
            const userIndevidualId = this.$store.state.userIndevidualId;
            if(!!!userIndevidualId) {
                this.openLoginModal();
                return ;
            }
            const url = '/prod/favorite/edit';
            const params = { 'use_indevidualId': userIndevidualId , 'product_id':productId};
            axios.post(url, params).then(res => {
                const result = res.data;
                if(result) {
                    this.$nextTick();
                }
            }).catch(err => {
                console.log(err);
            });
        },
    }

}
</script>
<style scoped>
.product_list {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.heart_icon {
    transform: translate(-30%, 10%);
}
</style>