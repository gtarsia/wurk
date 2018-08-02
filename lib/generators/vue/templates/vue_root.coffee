import Vue from 'vue'
import store from 'store/index'

vue = new Vue
  el: '#app'
  store: store
  data:
    burgerActive: false
  methods:
    toggleBurger: ->
      @burgerActive = !@burgerActive

  # mounted: ->
