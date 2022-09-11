<template>
    <div class="main_image p_relative">
        <div class="carousel_image p_absolute">
            <img src="/server/img/common/mainPage1.jpg/get" :class="{'opacity_00': firstCarousel == currentCarouse}">
            <div class="carousel_text window_container">
                <div class="p_absolute">
                    <div class="fs_title_00 fw_600">
                        Clean beauty is <br>
                        the new standard <br>
                    </div>
                    <br>
                    <div class="carousel_content fw_300">
                        "Make Organics" is a new skincare line for Make beauty. <br>
                        Make Organics recognizes that everything we put on our skin bucomes a part of us.
                    </div>
                    <p>
                        <br>
                        <br>
                    </p>
                    <div>
                        <button class="button_01">View Detail</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel_image p_absolute">
            <img src="/server/img/common/mainPage2.jpg/get" :class="{'opacity_00': secondCarousel == currentCarouse}">
            <div class="carousel_text window_container">
                <div class="p_absolute">
                    <div class="fs_title_00 fw_600">
                        Clean beauty is <br>
                        the new standard <br>
                    </div>
                    <br>
                    <div class="carousel_content fw_300">
                        "Make Organics" is a new skincare line for Make beauty. <br>
                        Make Organics recognizes that everything we put on our skin bucomes a part of us.
                    </div>
                    <p>
                        <br>
                        <br>
                    </p>
                    <div>
                        <button class="button_01">View Detail</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel_button p_absolute">
            <input type="radio" id="firstCarousel" value="1" v-model="currentCarouse"> <label :class="{'selected_radio': firstCarousel == currentCarouse  }" for="firstCarousel" class="radio"></label>
            <input type="radio" id="secondCarousel" value="2" v-model="currentCarouse"><label :class="{'selected_radio': secondCarousel == currentCarouse }" for="secondCarousel" class="radio"></label>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            carousel: {
                currentCarouse: 1,
                firstCarousel: 1,
                secondCarousel: 2,
                stopFlg: false,
                interval: 5000,
            },
            carouselButton:1,
        }
    },
    mounted() {
        this.runCarousel();
    },
    computed: {
        currentCarouse: {
            get() { return this.carousel.currentCarouse; },
            set(val) {
                if(val > 2)
                {
                    this.carousel.currentCarouse = 1 
                    return;
                }
                this.carousel.currentCarouse = val 
            }
        },
        firstCarousel: {
            get() { return this.carousel.firstCarousel; },
        },
        secondCarousel: {
            get() { return this.carousel.secondCarousel; },
        },
        stopFlg: {
            get() { return this.carousel.stopFlg; },
            set(val) { this.carousel.stopFlg = val }
        }
    },
    methods: {
        runCarousel() {
            setInterval(()=>{
                this.currentCarouse++;
            }, this.carousel.interval)
        },
    },
}
</script>
<style scoped>
.main_image {
    height: 43rem;
}
.carousel_image {
    width: 100%;
    height: 100%;
    overflow: hidden;
}
img {
    position: absolute;
    top: 5rem;
    transform: scale(1.3);
    transition: all 2.5s ease;
}
.carousel_text {
    margin-top: 10rem;
}
.carousel_button {
    left: 50%;
    bottom: 1rem;
}
input[type='radio'] {
    display: none;
}
.radio {
    margin: 0.5rem;
    display: inline-block;
    width: 0.6rem;
    height: 0.6rem;
    content: "";
    border: 1px solid #2a2a2a;
    border-radius: 50%;
}
.selected_radio {
    display: inline-block;
    width: 0.6rem;
    height: 0.6rem;
    content: "";
    border: 2px solid #2a2a2a;
    background: #2a2a2a;
    border-radius: 50%;
}

</style>