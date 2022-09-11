<template>
    <div class="window_container space_06">
        <div class="fc_gray_04 space_01">
            <div class="px_20"><router-link to="/">Home</router-link> — <router-link to="/community/Notice">Community</router-link> — {{pageName}}</div>
            <div class="fs_title_01 fc_gray_03 fw_600 px_20">{{pageName}}</div>
        </div>
        <CommunityNav :pageName="pageName"/>
        <Event :pageName="pageName" />
        <Notice :pageName="pageName" />
        <UserCommunication :pageName="pageName" />
    </div>
</template>
<script>
import Event from './Event.vue';
import CommunityNav from './CommunityNav.vue';
import Notice from './Notice.vue';
import UserCommunication from './UserCommunication.vue';
import { getCurrentInstance } from 'vue';
export default {
    props: {
        pageName: {
            type: String,
            require: true,
        },
    },
    components: {
        Event,
        CommunityNav,
        Notice,
        UserCommunication,
    },
}
</script>
<style scoped>
    
</style>