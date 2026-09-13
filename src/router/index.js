import { createRouter, createWebHistory } from 'vue-router'
import PaginaPrincipal from '../views/PaginaPrincipal.vue'
import PaginaContato from '@/views/PaginaContato.vue'
import PaginaPosts from '@/views/PaginaPosts.vue'
import PaginaMensagem from '@/views/PaginaMensagem.vue'

const routes = [
  {
    path: '/',
    name: 'home',
    component: PaginaPrincipal
  },
  {
    path: '/contato',
    name: 'contato',
    component: PaginaContato
  },
  {
    path: '/posts',
    name: 'posts',
    component: PaginaPosts
  },
  {
    path: '/mensagem',
    name: 'mensagem',
    component: PaginaMensagem
  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
