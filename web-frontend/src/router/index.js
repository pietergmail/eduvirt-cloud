import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Machines from '../views/Machines.vue'
import AddMachine from '../views/AddMachine.vue'

// OpenID Connect

// import { authGuard } from "../auth/authGuard";

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    redirect: '/login'
  },
  {
    path: '/callback',
    redirect: '/home'
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/home',
    name: 'Home',
    component: Home,
    // beforeEnter: authGuard
  },
  {
    path: '/add_machine',
    name: 'add_machine',
    component: AddMachine,
    // beforeEnter: authGuard
  },
  {
    path: '/machines',
    name: 'machines',
    component: Machines,
    // beforeEnter: authGuard
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
