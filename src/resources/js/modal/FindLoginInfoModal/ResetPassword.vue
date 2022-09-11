<template>
    <div v-if="resetPassword == displayFlg">
        <div class="py_15 text-center fs_title_02 fw_600">
            Reset Password
        </div>
        <div class="fc_gray_05 fw_500">
            We found an account that matches the information you entered. Please select a method to reset the password.
        </div>
        <div class="py_05 fw_800">
            <input class="radio_mail" type="radio" name="" id="reset_to_mail" checked>
            <label class="lbl_radio_mail px_05" for="reset_to_mail">Reset to subscribed email</label>
        </div>
        <div class="fc_gray_05 fw_500">
            Would you like to send the correct account information to the email address below registered in the membership information?
        </div>
        <div class="text_box fs_subtitle fc_black fw_800">
            {{displayMaskedEmail(userInfoResult[0].user_email)}}
        </div>
        <div class="space_01"></div>
        <div>
            <button class="button_01 w_100" @click="SendEmailToResetPassword">Continue</button>
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
        },
    },
    data() {
        return {
            resetPassword: 3
        }
    },
    methods: {
        displayMaskedEmail(src) {
            const sourceEmail = src.split('@');
            const userEmail = sourceEmail[0].substring(0, 4).padEnd(8, '*') + '@' + sourceEmail[1];
            return userEmail;
        },
        SendEmailToResetPassword() {
            alert('You cannot use the password search because there is a problem with the mailing settings. Please contact your administrator.');
        },
    }
}
</script>
<style scoped>
</style>