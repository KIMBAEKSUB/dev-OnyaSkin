<template>
    <div class="middle_search_wrap">
        <div class="fs_title_02 fw_600">NEWSLETTER</div>
        <div class="middle_search_input_warp">
            <div>
               <input class="input_02" type="email" placeholder="E-mail" v-model="userEmail">
            </div>
            <div>
                <button class="button_01" @click="subscribe">Subscribe</button>
            </div>
        </div>
    </div>
    <div class="space_02"></div>
    <MessageModal
        :active="messageModalFlg"
        :messageOption="messageModalOption"
        @closeMessageModal="closeMessageModal"
    />
</template>
<script>
import MessageModal from '../../modal/MessageModal/MessageModal.vue';
export default {
    data () {
        return {
            userEmail: null,
            messageModalFlg: false,
            messageModalOption: {
                message: null,
                icon: null,
            },
        }
    },
    components: {
        MessageModal
    },
    methods: {
        subscribe() {
            if(this.validateSubcribeForm()) {
                const option = {
                    message: 'please Fill by the email form',
                    icon: 'info_outline',
                };
                this.openMessageModal(option);
                return
            }
            this.openMessageModal({message: 'your subcribe is completed'});
        },
        validateSubcribeForm() {
            return this.isEmptyUserEmail() || this.isEmailFormat();
        },
        isEmptyUserEmail() {
            return !!!this.userEmail;
        },
        openMessageModal(option) {
            this.messageModalFlg = true;
            this.messageModalOption.message = option.message;
            this.messageModalOption.icon = option.icon;
        },
        closeMessageModal() {
            this.messageModalFlg = false;
        },
        isEmailFormat() {
            const str = /^[a-zA-Z0-9.! #$%&'*+/=? ^_`{|}~-]+@[a-zA-Z0-9-]+(?:\. [a-zA-Z0-9-]+)*$/
            return !!!str.test(this.userEmail);
        },
    },
}
</script>
<style scoped>
.middle_search_wrap {
    background: url('/server/img/common/bg1.png/get');
    background-repeat: no-repeat;
    background-size: cover;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 4rem 0;
    width: 100%;
}
.middle_search_input_warp {
    display: flex;
    height: 3rem;
    margin-top: 1rem;
}
.middle_search_input_warp input {
    width: 30rem;
    margin-right: 0.5rem;
}
</style>