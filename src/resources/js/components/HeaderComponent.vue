<template>
    <div class="window_container header">
        <div class="row">
            <div class="col-sm-4 header_nav_bar">
                <div class="d-inline-block px-2 fc_gray_02">
                    <span class="material-icons icon_size_01">card_giftcard</span>
                    <span class="">Event</span>
                </div>
                <div class="d-inline-block px-2 fc_gray_02">
                    <span class="material-icons icon_size_01">workspace_premium</span>
                    <span>Membership</span>
                </div>
                <div class="d-inline-block px-2 fc_gray_02">
                    <span class="material-icons icon_size_01">add_a_photo</span>
                    <span>Instagram</span>
                </div>
            </div>
            <div class="col-sm-4 text-center fs_title_01 fc_gray_01 fw_700">
                <a href="/">
                    Onya Skin
                </a>
            </div>
            <div class="col-sm-4 header_login_bar fc_gray_02">
                <div v-if="this.$store.state.userIndevidualId">
                    <span><a>My</a></span>
                    <span class="px-3 fc_gray_02 small fc_gray_06">/</span>
                    <span><a @click="excuteLogout">Logout</a></span>
                </div>
                <div v-else>
                    <span><a @click="openLoginModal">Login</a></span>
                    <span class="px-3 fc_gray_02 small fc_gray_06">/</span>
                    <span><a @click="openJoinConsentModal">Join</a></span>
                </div>
            </div>
        </div>
    </div>
    <login-modal
        :active="loginModalDisplayFlg"
        @closeLoginModal="closeLoginModal"
        @openJoin="openJoinModal"
        @openFindUserInfoModal="openFindUserInfoModal"
    ></login-modal>
    <join-consent-modal
        :active="joinConsentModalDisplayFlg"
        @closeJoinConsentModal="closeJoinConsentModal"
        @openJoinModal="openJoinModal"
    ></join-consent-modal>
    <join-modal
        :active="joinModalDisplayFlg"
        @closeJoinModal="closeJoinModal"
    ></join-modal>
    <find-user-info-modal
        :active="findUserInfoModalFlg"
        @closeFindUserInfoModal="closeFindUserInfoModal"
        @openLoginModal="openLoginModal"
    ></find-user-info-modal>
    <message-modal />
</template>
<script>
import loginModal from '../modal/LoginModal/LoginModal.vue';
import joinModal from '../modal/JoinModal/JoinModal.vue';
import joinConsentModal from '../modal/JoinConsentModal/JoinConsentModal.vue';
import findUserInfoModal from '../modal/FindLoginInfoModal/FindLoginInfoModal.vue';
import MessageModal from '../modal/MessageModal/MessageModal.vue';
export default {
    data() {
        return {
            isLogin: false,
            loginModalDisplayFlg: false,
            joinConsentModalDisplayFlg: false,
            joinModalDisplayFlg: false,
            findUserInfoModalFlg: false,
        }
    },
    components: {
        loginModal,
        joinModal,
        joinConsentModal,
        findUserInfoModal,
        MessageModal,
    },
    methods: {
        openLoginModal () {
            this.closeFindUserInfoModal();
            this.loginModalDisplayFlg = true;
        },
        closeLoginModal () {
            this.loginModalDisplayFlg = false;
        },
        openJoinConsentModal () {
            this.joinConsentModalDisplayFlg = true;
        },
        closeJoinConsentModal () {
            this.joinConsentModalDisplayFlg = false;
        },
        openJoinModal () {
            this.loginModalDisplayFlg = false;
            this.joinConsentModalDisplayFlg = false;
            this.joinModalDisplayFlg = true;
        },
        closeJoinModal () {
            this.joinModalDisplayFlg = false;
        },
        excuteLogout () {
            this.$store.commit('setUserIndevidualId', null);
            this.$nextTick();
        },
        openFindUserInfoModal () {
            this.loginModalDisplayFlg = false;
            this.findUserInfoModalFlg = true;
        },
        closeFindUserInfoModal () {
            this.findUserInfoModalFlg = false;
        }
    }
}
</script>
<style scoped>
.header {
    padding: 2rem 0;
}
.header_wrap {
    display: flex;
    justify-content: space-between;
}
.header_login_bar {
    text-align: right;
    padding: 0.7rem;
}
.header_nav_bar {
    padding: 0.7rem;
}

</style>