import axios from 'axios'
import 'babel-polyfill'
import Vue from 'vue'
import store from 'store/index'

token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

vue = new Vue
  el: '#app'
  store: store
  data:
    burgerActive: false
  methods:
    toggleBurger: ->
      @burgerActive = !@burgerActive

  # mounted: ->
