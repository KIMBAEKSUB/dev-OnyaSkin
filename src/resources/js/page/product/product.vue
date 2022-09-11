<template>
    <div class="window_container space_06">
        <div>
            Home - Skincare
        </div>
        <div>
            상품 페이지
        </div>

    </div>
</template>
<script>
import { getCurrentInstance, onMounted } from 'vue';
export default {
    props: {
        prodId: {
            type: String,
        }
    },
    setup(props) {
        onMounted({});
    },
}
</script>
<style scoped>
    
</style>