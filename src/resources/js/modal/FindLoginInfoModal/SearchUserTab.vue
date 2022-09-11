<template>
    <div v-if="searchTab == displayFlg">
        <div class="py_15 text-center fs_title_02 fw_600">Search UserId By Email Address</div>
        <div>
            <div class="fc_gray_05 fw_500">
                please fill this text box with your name and Email address <br>
                ex) 'test@email.com' → 'test@email.com'
            </div>
            <div class="py_15">
                <input type="text" class="input_01 w_100" placeholder="user Name" style="border-bottom: none;" v-model="userInfo.userName">
                <input type="text" class="input_01 w_100" placeholder="user Email" v-model="userInfo.userEmail">
            </div>
            <div>
                <button class="button_01 w_100" @click="searchUserInfo">Search</button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'SearchUserTab',
    props: {
        displayFlg: {
            type: Number,
            require: true,
        }
    },
    watch: {
        'userInfo.userEmail': function (val) {
            const str = /\s/
            if(str.test(val))
            {
                this.userInfo.userEmail = this.userInfo.userEmail.replace(str, '');
            }
        },
        'userInfo.userName': function (val) {
            const str = /\s|\W|\d/
            if(str.test(val))
            {
                this.userInfo.userName = this.userInfo.userName.replace(str, '');
            }
        },
    },
    data () {
        return {
            _searchTab: 1,
            userInfo: {
                userName: null,
                userEmail: null,
            },
        }
    },
    computed: {
        searchTab: {
            get () { return this._searchTab; }
        }
    },
    methods: {
        searchUserInfo () {
            if(! this.validateUserInfo())
            {
                alert('please fill the text box');
                return;
            }
            this.$emit('searchUserInfo', this.userInfo);
        },
        validateUserInfo() {
            return !!this.userInfo.userName
                    && !!this.userInfo.userEmail
        }
    },
}
</script>
<style scoped>
    
</style>