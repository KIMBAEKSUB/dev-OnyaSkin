import './bootstrap';
import {createApp} from 'vue'
import { createStore } from 'vuex'
import App from './App.vue'
import store from './store/index.js';
import router from './router';

const app = createApp(App)
app.use(createStore(store))
app.use(router)
app.mount("#app")