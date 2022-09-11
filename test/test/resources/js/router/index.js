import { createRouter, createWebHashHistory } from 'vue-router'

const Home = {

}

const routes = [
    { path: '/', component: Home },
  ]

export default createRouter({
    history: createWebHashHistory(),
    routes,
}) 