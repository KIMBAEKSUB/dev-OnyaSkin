<template>
    <div class="px-5">
        <div class="row">
            <div class="col-sm-2">
                <div class="fs_title_01 fw_500">Onya Skin.</div>
                <p class="fc_gray_05">c 2022 Onya Skin</p>
            </div>
            <div class="col-sm-2">
                <div class="fs_subtitle px_05">SITE MAP</div>
                <ul class="fc_gray_05 fw_300">
                    <div v-for="(menu, key) in menus" :key="key">
                        <router-link :to="menu.menu_url" ><li class="footer_menu_list" v-if="menu.menu_kbn === 0">{{menu.menu_name}}</li></router-link>
                    </div>
                </ul>
            </div>
            <div class="col-sm-5">
                <div class="fs_subtitle px_05">SERVICE</div>
                <p class="fc_gray_05 fw_300">
                    000-0000-0000 <br>
                    Mon - Fri AM 09:00 - 18:00 <br>
                    Sat.Sun.Red-Day Off <br>
                </p>
                <div class="fs_subtitle px_05">BANK</div>
                <p class="fc_gray_05 fw_300">
                    KB BANK 000-0000-00000 <br>
                    Onya Corp. <br>
                </p>
            </div>
            <div class="col-sm-3">
                <div class="fs_subtitle">INSTARGRAM</div>
            </div>
        </div>
        <div class="space_01"><hr class="footer_hr"></div>
        <div class="row">
            <div class="fc_gray_05 col-sm-7">
                <p>
                    Seoul, Korea <span class="footer_delimiter">ㅣ</span> Font License 000-00-00000 <span class="footer_delimiter">ㅣ</span> Communication Sales Business Report 0000-Seoul-0000
                </p>
                <p>
                    Hosting by Kim's House
                </p>
            </div>
            <div class="fc_gray_05 col-sm-5 footer_terms">
                <span class=""><a @click="openTermsOfUse">Terms of Use</a></span>
                <span class="footer_delimiter"> | </span>
                <span class=""><a @click="openPrivacyPolicy">Privacy</a></span>
            </div>
        </div>
        <div class="space_01"></div>
    </div>
    <privecy-policy-modal
        :active="showPrivacyPolicyFlg"
        @colsePrivacyPolicy="colsePrivacyPolicy"
    ></privecy-policy-modal>
    <termsofuse-modal
        :active="showTermsOfUseFlg"
        @colseTermsOfUse="colseTermsOfUse"
    >
    </termsofuse-modal>
</template>
<script>
import serverHttp from '../axios/index';
import PrivecyPolicyModal from '../modal/PrivecyPolicyModal/PrivecyPolicyModal.vue';
import TermsofuseModal from '../modal/TermsofuserModal/TermsofuseModal.vue';
export default {
    data() {
        return {
            menus: null,
            showPrivacyPolicyFlg: false,
            showTermsOfUseFlg: false,
        }
    },
    mounted() {
        this.getMenu();
    },
    components: {
        PrivecyPolicyModal,
        TermsofuseModal
    },
    methods: {
        getMenu() {
            const url = '/main/menu/get';
            serverHttp.get(url).then(res => {
                this.menus = res.data;
            }).catch(err => {
                if(err.response) {
                    console.log(err.response.data);
                    console.log(err.response.status);
                    console.log(err.response.statusText);
                } else if (err.request) {
                    console.log('error', err.request);
                } else {
                    console.log('error', err);
                }
            });
        },
        openPrivacyPolicy(){
            this.showPrivacyPolicyFlg = true;
        },
        colsePrivacyPolicy(){
            this.showPrivacyPolicyFlg = false;
        },
        openTermsOfUse(){
            this.showTermsOfUseFlg = true;
        },
        colseTermsOfUse(){
            this.showTermsOfUseFlg = false;
        }
    },
}
</script>
<style scoped>
.footer_hr {
    opacity: 1;
}
.footer_menu_list {
    padding: 0.3rem 0;
}
.footer_delimiter {
    font-size: 0.6rem;
    padding: 0 0.5rem;
}
.footer_terms {
    text-align: right;
}
</style>