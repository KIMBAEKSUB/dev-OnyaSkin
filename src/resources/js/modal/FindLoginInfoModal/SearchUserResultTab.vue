<template>
    <div v-if="searchResultTab == displayFlg">
        <div v-if="!!userInfoResult">
            <div class="py_15 text-center fs_title_02 fw_600">Searched Result</div>
            <div class="fc_gray_05 fw_500">
                We found an account that matches the information you entered.
            </div>
            <div>
                <ul>
                    <div class="text_box fw_800 fc_black" v-for="(value, key) in userInfoResult" :key="key">
                        <li class="fs_subtitle">{{displayMaskedUserId(value.user_indevidual_id)}}</li>
                    </div>
                </ul>
            </div>
            <div class="space_01"></div>
            <div class="d_flex_space_between">
                <div class="search_botton_wrap">
                    <button class="button_02 w_100" @click="openResetPasswordTab">Reset</button>
                </div>
                <div class="search_botton_wrap">
                    <button class="button_01 w_100" @click="openLoginModal">Login</button>
                </div>
            </div>
            <div class="fw_600 py_05 fc_gray_05">
                <a @click="openResetPasswordTab">I really do not know my Id</a>
            </div>
        </div>
        <div v-else>
            <div class="py_15 text-center fs_title_02 fw_600">Searched Result</div>
            <div class="fc_gray_05 fw_500">
                We didn't find an account that matches the information you entered.
            </div>
            <div class="space_01"></div>
            <button class="button_01 w_100" @click="openSearchTab">Back</button>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        displayFlg: {
            type: Number,
            require: true,
        },
        userInfoResult: {
            type: Object,
            require: true,
        }
    },
    data () {
        return {
            _searchResultTab: 2,
        }
    },
    computed: {
        searchResultTab: {
            get () { return this._searchResultTab; }
        }
    },
    methods: {
        openLoginModal() {
            this.$emit('openLoginModal');
        },
        displayMaskedEmail(src) {
            const sourceEmail = src.split('@');
            const userEmail = sourceEmail[0].substring(0, 4).padEnd(8, '*') + '@' + sourceEmail[1];
            return userEmail;
        },
        displayMaskedUserId(src) {
            const userId = src.substring(0, 4).padEnd(8, '*');
            return userId;
        },
        openSearchTab() {
            this.$emit('openSearchTab');
        },
        openResetPasswordTab() {
            this.$emit('openResetPasswordTab');
        }
    },
}
</script>
<style scoped>
.search_botton_wrap {
width: 48%;
}
</style>