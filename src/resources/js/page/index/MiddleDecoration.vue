<template>
    <div class="middle_decoration window_container d_flex_space_between">
        <div class="middle_decoration_01">
            <img class="w_100" src="/server/img/common/ms1.jpg/get">
        </div>
        <div class="middle_decoration_02 p_relative">
            <div class="top_0 img_wrap p_absolute">
                <div class="md_text w_100 h_100 p_absolute">Annual Reports</div>
                <img class="w_100" src="/server/img/common/ms2.jpg/get">
            </div>
            <div class="bottom_0 p_absolute img_wrap">
                <div class="md_text w_100 h_100 p_absolute">Spring Lips</div>
                <img class="md_bottom_img w_100" src="/server/img/common/ms3.jpg/get">
            </div>
        </div>
    </div>
    <div class="space_03"></div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
.middle_decoration_01 {
    width: 66%;
}
.middle_decoration_02 {
    width: 32%;   
}
.md_text {
    background-color: rgb(255, 223, 229);
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 800;
    font-size: 2rem;
    opacity: 0;
}
.middle_decoration_02 > div:hover > img {
    transform: scale(1.3);
}
.middle_decoration_02 > div:hover > .md_text {
    z-index: 1;
    opacity: 0.75;
    transition: all 0.4s;
}
</style>