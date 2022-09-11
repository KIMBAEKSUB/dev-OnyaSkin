<template>
    <div class="modal_background_01" @click.self="closeMessageModal" v-if="active">
        <div class="modal_02 p_relative">
            <div class="messageModal_text">
                <div class="messageModal_icon_wrap">
                    <span class="messageModal_icon material-icons">
                        {{!!messageOption.icon ?  messageOption.icon : null}}
                    </span>
                </div>
                {{messageOption.message}}
            </div>
            <div class="">
                <button class="messageModal_button button_03 w_100" @click="closeMessageModal">check</button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        active: {
            type: Boolean,
            require: true,
        },
        messageOption: {
            type: Object,
            require: true,
        }
    },
    data() {
        return {

        }
    },
    methods: {
        closeMessageModal() {
            this.$emit('closeMessageModal')
        },
    }
}
</script>
<style scoped>
.messageModal_text {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2rem 2rem;
}
.messageModal_button {
    border-radius: 0rem 0rem 0.3rem 0.3rem;
}
.messageModal_icon {
    font-size: 4rem;
    padding: 1rem 0;
}
</style>