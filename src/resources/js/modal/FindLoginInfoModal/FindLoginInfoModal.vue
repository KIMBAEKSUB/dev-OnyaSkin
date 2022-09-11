<template>
    <div v-if="active" @click.self="closeFindUserInfoModal" class="modal_background">
        <div class="modal_01 fs_discription_02 fc_gray_04">
            <span class="material-icons close_icon fc_gray_05" @click="closeFindUserInfoModal">close</span>
                <search-tab 
                    :displayFlg="displayFlg"
                    @searchUserInfo="searchUserInfo"
                ></search-tab>
                <search-result-tab
                    :displayFlg="displayFlg"
                    :userInfoResult="userInfoResult"
                    @openLoginModal="openLoginModal"
                    @openSearchTab="openSearchTab"
                    @openResetPasswordTab="openResetPasswordTab"
                ></search-result-tab>
                <reset-password
                    :displayFlg="displayFlg"
                    :userInfoResult="userInfoResult"
                ></reset-password>
        </div>
    </div>
</template>
<script>
import axios from '../../axios/index';
import SearchTab from './SearchUserTab.vue';
import SearchResultTab from './SearchUserResultTab.vue';
import ResetPassword from './ResetPassword.vue';
export default {
    props: {
        active: {
            type: Boolean,
            require: true,
        }
    },
    components: {
        SearchTab,
        SearchResultTab,
        ResetPassword,
    },
    data() {
        return {
            _displayFlg: 1,
            _searchTabIndex: 1,
            _searchResultTabIndex: 2,
            _resetPasswordTabIndex: 3,
            _userInfoResult: {},
        }
    },
    watch: {
        active(value) {
            if(value) {
                this.displayFlg = 1;
            }
        }
    },
    computed: {
        displayFlg: {
            get() { return this._displayFlg; },
            set(value) { this._displayFlg = value; }
        },
        userInfoResult: {
            get() { return this._userInfoResult; },
            set(value) { this._userInfoResult = value; }
        },
        searchTabIndex: {
            get() { return this._searchTabIndex; },
        },
        searchResultTabIndex: {
            get() { return this._searchResultTabIndex; },
        },
        resetPasswordTabIndex: {
            get() { return this._resetPasswordTabIndex; },
            set(value) { this._resetPasswordTabIndex = value; }
        },
    },
    methods: {
        closeFindUserInfoModal() {
            this.$emit('closeFindUserInfoModal');
        },
        openLoginModal () {
            this.$emit('openLoginModal');
        },
        openSearchTab () {
            this.displayFlg = this.searchTabIndex;
        },
        openSearchResultTab () {
            this.displayFlg = this.searchResultTabIndex;
        },
        openResetPasswordTab () {
            this.displayFlg = this.resetPasswordTabIndex;
        },
        async searchUserInfo (userInfo) {
            this.userInfoResult = await this.getUserInfo(userInfo);
            this.openSearchResultTab();
        },
        async getUserInfo(userInfo) {
            const url = `/user/${userInfo.userName}/${userInfo.userEmail}/search`;
            try {
                const response = await axios.post(url, userInfo);
                if(response.status !== 200) {
                    throw error('there are some error');
                }
                return response.data;
            } catch (error) {
                if(error.request && error.request.response)
                alert(error.request.response.message);
            }
            
        }
    }
}
</script>
<style scoped>
</style>