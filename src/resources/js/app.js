import './bootstrap';
import { createApp } from 'vue/dist/vue.esm-bundler';
import { createStore } from 'vuex';
import store from './store';
import router from './route';
import mitt from 'mitt';

const app = createApp({});
app.use(createStore(store))
app.use(router);

const emitter = mitt();
app.config.globalProperties.emitter = emitter;
app.mount('#app');