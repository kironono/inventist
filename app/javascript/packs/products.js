import Vue from 'vue/dist/vue.esm'
import ProductStatusControl from '../components/product_status_control.vue'


document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#products',
    components: {
      ProductStatusControl
    }
  })
})
