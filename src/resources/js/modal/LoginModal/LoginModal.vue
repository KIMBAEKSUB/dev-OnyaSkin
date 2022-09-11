<template>
    <div class="modal_background" @click.self="closeLoginModal" v-if="active">
        <div class="modal_01 fs_discription_02">
            <span class="material-icons close_icon fc_gray_05" @click="closeLoginModal">close</span>
            <div class="py_15 text-center fs_title_02 fw_600">Login</div>
            <div>
                <input v-model="loginForm.userIndevidualId" class="input_01 w_100" type="test" placeholder="user ID" style="border-bottom:none">
                <input v-model="loginForm.userPassword" class="input_01 w_100" type="password" placeholder="Password">
            </div>
            <div>
                <input type="checkbox" id="login_stay_flg"><div class="check_box"></div>
                <label class="login_stay_lbl" for="login_stay_flg">Maintain login status</label>
            </div>
            <div>
                <button class="button_01 px_05 w_100" @click="excuteLogin">Login</button>
            </div>
            <div class="d_flex_space_between py_10">
                <div><a @click="openJoin">Join</a></div>
                <div><a @click="openFindUserInfoModal">forgot Id or Password</a></div>
            </div>
            <div class="hr_decoration d_flex_space_between">
                <div class="hr">
                    <hr>
                </div>
                <div>
                    Or
                </div>
                <div class="hr">
                    <hr>
                </div>
            </div>
            <div>
                <button class="button_02 px_05 w_100">Non-member Order Tracking</button>
            </div>
        </div>
    </div>
</template>
<script>
import axios from '../../axios/index';
export default {
    props: {
        active: {
            type: Boolean,
            require: true,
        }
    },
    watch: {
        'loginForm.userIndevidualId'(value){
            const str = /[^\w]|\s/;
            if(str.test(value)) {
                this.loginForm.userIndevidualId = this.loginForm.userIndevidualId.replace(str, '');
            }
        },
        'loginForm.userPassword'(value){
            const str = /\s/;
            if(str.test(value)) {
                this.loginForm.userPassword = this.loginForm.userPassword.replace(str, '');
            }
        },
    },
    data() {
        return {
            loginForm: {
                userIndevidualId: null,
                userPassword: null,
            },
            errorMessage: null,
        }
    },
    methods: {
        closeLoginModal() {
            this.$emit('closeLoginModal');
        },
        openJoin () {
            this.$emit('openJoin');
        },
        openFindUserInfoModal () {
            this.$emit('openFindUserInfoModal');
        },
        async excuteLogin() {
            if(! this.validateLoginForm()) {
                this.displayErrorMessage();
                return ;
            }
            const userIndevidualId = await this.submitForLogin();
            this.registerGlobalUserIndeviduaulId(userIndevidualId);
            alert('hello!! ' + userIndevidualId);
            this.closeLoginModal();
        },
        validateLoginForm () {
            var output = true;
            if( this.isEmptyForms() ){
                this.errorMessage = 'please fill all items.';
                output = false
            }            
            return output;
        },
        isEmptyForms () {
            return !this.loginForm.userIndevidualId || !this.loginForm.userPassword
        },
        showError() {
            this.displayErrorMessage();
            this.clearErrorMessage();
        },
        displayErrorMessage () {
            alert(this.errorMessage);
        },
        clearErrorMessage () {
            this._errorMessage = [];
        },
        async submitForLogin() {
            const url = `/user/${this.loginForm.userIndevidualId}/authoritication`;
            try {
                const res = await axios.post(url, this.loginForm);
                return res.data.userIndevidualId;
            } catch (error) {
                this.noticeError(error);
            }
        },
        noticeError(error) {
            const errorArray = ['there are some error.'];
            if(error.request && error.request.response) {
                errorArray.push(JSON.parse(error.request.response).message);
            }
            alert(errorArray.join('\n'));
        },
        registerGlobalUserIndeviduaulId(userIndevidualId) {
            this.$store.commit('setUserIndevidualId', userIndevidualId);
        },
        displayDoneWithJoin() {
            alert('Hollow ' + this.$store.state.userIndevidualId);
        },
    }
}
</script>
<style scoped>
.login_stay_lbl {
    margin: 1rem 0.5rem;
}
.hr_decoration {
    margin-bottom: 1rem;
}
.hr_decoration .hr {
    width: 45%;
    transform: translate(0, -20%);
}
</style>