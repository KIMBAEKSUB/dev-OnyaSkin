<template>
    <div class="content_nav_wrap">
        <div class="content_nav">
            <div class="window_container">
                <div class="menu_wrap">
                    <div v-for="(mainMenu, key) in mainMenus" :key="key">
                        <router-link
                            v-if="mainMenu.menu_kbn == 0"
                            :to="mainMenu.menu_url"
                        >
                            <li class="letter_spacing_05 fw_300 px_40 py_20 fc_gray_09"
                                    @mouseover="displaySubMenu(mainMenu.menu_id)"
                                    @mouseleave="hiddenSubMenu"
                                >{{mainMenu.menu_name}}</li>
                        </router-link>
                        <div class="submenu_wrap">
                            <router-link 
                                v-for="(submenu, key) in subMenus" :key="key" 
                                :to="submenu.menu_url">
                                <li v-if="submenu.menu_kbn == 1 && submenu.menu_affiliation_id == mainMenu.menu_id"
                                    :class="{'d_block': submenu.menu_affiliation_id == subMenuDisplayFlg, 'd_none': submenu.menu_affiliation_id != subMenuDisplayFlg}"
                                    class="submenu letter_spacing_05 fw_300 px_40  py_05 fc_gray_04 fs_discription_02"
                                    @mouseover="displaySubMenu(submenu.menu_affiliation_id)"
                                    @mouseleave="hiddenSubMenu"
                                >{{submenu.menu_name}}</li>
                            </router-link>
                        </div>
                    </div>
                </div>
                <div class="cart_icon fw_300 px_40 py_20 fc_gray_09">
                    <a href=""><span class="material-icons fc_gray_09">shopping_cart</span></a>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import axios from '../axios';
export default {
    data() {
        return {
            mainMenus: {},
            subMenus: {},
            subMenuDisplayFlg: null,
        }
    },
    mounted() {
        this.getMenu();
    },
    methods: {
        getMenu() {
            axios.get('/main/menu/get').then(res => {
                const data = res.data;
                this.mainMenus = data.filter(val => val.menu_kbn == 0);
                this.subMenus = data.filter(val => val.menu_kbn == 1);
            }).catch(err => {
                console.error(err);
            })
        },
        displaySubMenu(val) {
            this.subMenuDisplayFlg = val;
        },
        hiddenSubMenu() {
            this.subMenuDisplayFlg = null;
        },
    },
}
</script>
<style scoped>
.content_nav_wrap {
    position: sticky;
    top: 0;
    z-index: 9999;
}
.content_nav {
    width: 100%;
    background: #2A2A2A;
}
.menu_wrap {
    display: flex;
    justify-content:center;
}
.cart_icon {
    float: right !important;
    transform: translate(0, -89%);
}
.submenu_wrap {
    position: absolute;
    background: #f1f1f1;
}
.submenu_wrap li:hover {
    background-color: #d4d4d4;
    transition: all 0.1s ease-in;
}
.submenu {
    padding-right: 3.35rem;
}
</style>