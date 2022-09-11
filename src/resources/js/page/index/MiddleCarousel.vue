<template>
    <div class="middle_carousel_content window_container">
        <div class="fs_title_01 fw_500 fc_gray_04">BEST PRODUCT</div>
        <div class="middle_carousel_wrap px_15 fc_gray_04">
            <div class="d_flex_space_between" :style="carouselStyle" :class="{'middle_carousel': middleCarouselMovingFlg}">
                <div v-for="(product, key) in products" :key="key" class="middle_carousel_part">
                    <router-link :to="'/product/' + product.product_id + '/detail'" class="middle_carousel_part">
                        <div class="img_wrap_01">
                            <img class="w_100" :src="'/server/img/prod/' + product.product_code + '/get'">
                        </div>
                        <div class="fs_subtitle fw_500">{{product.product_name}}</div>
                        <div class="fs_discription px_15 text-center ">{{product.product_explain}}</div>
                    </router-link>
                </div>
            </div>
        </div>
        <div class="space_01"></div>
        <button class="button_01">View All Product</button>
    </div>
</template>
<script>
import axios from '../../axios';
export default {
    data() {
        return {
            imageCount: 9,
            products: [],
            carousel: {
                position: -22.5,
            },
            movingSize: -22.5,
            _carouselIndex: 1,
            middleCarouselMovingFlg: true,
        }
    },
    mounted() {
        this.getMiddleCarouselItems();
        this.runMiddleCarouse();
    },
    computed: {
        carouselStyle() {
            return {
                transform: `translate(${this.carouselPosition}vw, 0)`
            }
        },
        carouselPosition: {
            get() { return this.carousel.position},
            set(val) {this.carousel.position = val}
        },
        carouselIndex: {
            get() {return this._carouselIndex },
            set(val) { this._carouselIndex = val}
        }
    },
    methods: {
        getMiddleCarouselItems() {
            const url = `/img/prod/best/${this.imageCount}/get`;
            axios.get(url).then(res => {
                if(res.status === 200)
                this.products = res.data;
                this.products = this.products.concat(res.data.slice(0,5))
            }).catch(err => {
                console.log(err);
            })
        },
        runMiddleCarouse() {
            setInterval(() => {
                var index = this.getCarouselIndex();
                this.carouselPosition = index * (- 22.5);
                if(index == 10)
                {
                    this.initializeMiddleCarousel()
                    return ;
                }
            }, 3000);
        },
        getCarouselIndex() {
                if(this._carouselIndex > this.imageCount)
                {
                    return this._carouselIndex = 2;
                } 
                return ++this._carouselIndex
        },
        initializeMiddleCarousel() {
            setTimeout( () => {
                this.middleCarouselMovingFlg = false;
                this.carouselPosition = 1 * (- 22.5);
            }, 500);
            setTimeout( () => {
                this.middleCarouselMovingFlg = true;
            }, 550);
        },
        // moveCarousel() {
        //     var index = this.getCarouselIndex();
        //     this.carouselPosition = index * (- 22.5);
        //     if(index == 10)
        //     {
        //         this.initializeMiddleCarousel()
        //         return ;
        //     }
        // },
    },
}
</script>
<style scoped>
.middle_carousel_content {
    padding: 6rem 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.middle_carousel_wrap {
    width: 100%;
    display: flex;
    justify-content: space-between;
    overflow: hidden;
}
.middle_carousel {
    transition: all 0.5s ease;
    transform: translate(-22.5vw, 0);
}
.middle_carousel_part {
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>