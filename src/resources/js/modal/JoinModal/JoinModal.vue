<template>
    <div v-if="active" @click.self="closeJoinModal" class="modal_background">
        <div class="modal_01 fs_discription_02 fc_gray_04" style="padding: 1.5rem">
            <span class="material-icons close_icon fc_gray_05" @click="closeJoinModal">close</span>
            <form @click.prevent="submit">
                <div class="py_15 text-center fs_title_02 fw_600">JOIN</div>
                <div class="text-center">
                    <span class="material-icons account_circle fc_gray_05">
                        account_circle
                    </span>
                </div>
                <div>
                    <input v-model="joinForms.userIndevidualId" @blur="checkuserIndevidualId" class="input_01 w_100" style="border-bottom: none;" type="text" placeholder="ID">
                    <input v-model="joinForms.userEmail" class="input_01 w_100" style="border-bottom: none;" type="email" placeholder="email">
                    <input v-model="joinForms.userPassword" class="input_01 w_100" style="border-bottom: none;" type="password" placeholder="password">
                    <input v-model="joinForms.userComfirmPassword" class="input_01 w_100" type="password" placeholder="comfirm password">
                </div>
                <div class="py_15">
                    <div>Name</div>
                    <input v-model="joinForms.userName" class="input_01 w_100" type="text" placeholder="Please Write Yor Name">
                </div>
                <div>
                    <button class="button_01 w_100" @click="submitForJoin">Join</button>
                </div>
            </form>
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
        'joinForms.userIndevidualId'(value) {
            const str = /[^\w]|\s/;
            this.joinForms.userIndevidualId = this.joinForms.userIndevidualId.replace(str, '');
        },
        'joinForms.userPassword'(value) {
            const str = /\s/;
            this.joinForms.userPassword = this.joinForms.userPassword.replace(str, '');
        },
        'joinForms.userComfirmPassword'(value) {
            const str = /\s/;
            this.joinForms.userComfirmPassword = this.joinForms.userComfirmPassword.replace(str, '');
        },
        'joinForms.userName'(value) {
            const str = /[^a-z|^A-Z]/;
            this.joinForms.userName = this.joinForms.userName.replace(str, '');
        },
    }
    ,data () {
        return {
            joinForms: {
                userIndevidualId: null,
                userEmail: null,
                userPassword: null,
                userComfirmPassword: null,
                userName: null,
            },
            _errorMessage: [],
        } 
    },
    computed: {
        errorMessage: {
            get() { return this._errorMessage.join('\n')},
            set(value) { return this._errorMessage.push(value) },
        },
    },
    methods: {
        closeJoinModal () {
            this.$emit('closeJoinModal')
        },
        checkuserIndevidualId() {
            const target = this.joinForms.userIndevidualId;
            if(target == undefined || target.trim() == "" || target == null) {
                return ;
            }
            const url = `/user/${target}/search`;
            axios.get(url).then(res => {
                if(! res.data){
                    alert('this id is aleady exists.');
                }
            }).catch(error => {
               this.noticeError(error)
            })
        },
        async submitForJoin () {
            if(!this.validateForm()) {
                this.showError();
                return;
            }
            const userIndevidualId = await this.sendJoinForm();
            this.registerGlobalUserIndeviduaulId(userIndevidualId);
            this.displayDoneWithJoin();    
            this.closeJoinModal();
        },
        validateForm () {
            
            var output = true;
            
            if( this.isEmptyForms() ){
                this.errorMessage = 'please fill all items.';
                output = false
            }
            
            if ( !this.isCurrectConfirmPassword() ) {
                this.errorMessage = 'password is not available.';
                output = false;
            }
            
            return output;
        },
        isEmptyForms () {
            return ! this.joinForms.userIndevidualId
                || !this.joinForms.userPassword 
                || !this.joinForms.userComfirmPassword 
                || !this.joinForms.userName
                || !this.joinForms.userEmail
        },
        isCurrectConfirmPassword () {
            return this.joinForms.userPassword === this.joinForms.userComfirmPassword
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
        async sendJoinForm () {
            const url = '/user/create';
            try {
                const res = await axios.post(url, this.joinForms);
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
.account_circle {
    font-size: 8rem;
    cursor: pointer;
}
.photo_camera {
    background: #5b5b5b;
    border-radius: 50%;
    width: 2rem; height: 2rem;
}
</style>