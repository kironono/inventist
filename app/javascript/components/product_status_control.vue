<template>
  <div class="level is-mobile">
    <button class="button level-item" v-bind:class="classObjectForInStock" @click="updateStatus('in_stock')">在庫あり</button>
    <button class="button level-item" v-bind:class="classObjectForFewInStock" @click="updateStatus('few_in_stock')">残りわずか</button>
    <button class="button level-item" v-bind:class="classObjectForOutOfStock" @click="updateStatus('out_of_stock')">在庫切れ</button>
  </div>
</template>

<script>
import axios from 'axios'
import { csrfToken } from '@rails/ujs'

axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken()

export default {
  props: ['productId', 'initialStatus'],
  data: function() {
    return {
      status: ''
    }
  },
  created: function() {
    this.status = this.initialStatus
  },
  computed: {
    classObjectForInStock: function () {
      return [ this.status === 'in_stock' ? 'is-link' : 'is-light']
    },
    classObjectForFewInStock: function () {
      return [ this.status === 'few_in_stock' ? 'is-warning' : 'is-light']
    },
    classObjectForOutOfStock: function () {
      return [ this.status === 'out_of_stock' ? 'is-danger' : 'is-light']
    },
  },
  methods: {
    updateStatus: async function(toStatus) {
      const res = await axios.put('/api/private/products', {product_id: this.productId, status: toStatus})
      if (res.status !== 200) { process.exit() }
      this.status = res.data.status
    }
  }
}
</script>
