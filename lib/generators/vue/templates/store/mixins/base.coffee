import Vue from 'vue'

export default ({ api, storeName }) ->
  namespaced: true
  state:
    data: {}
    ids: []
  mutations:
    hydrate: (state, collection) ->
      for item in collection
        Vue.set state.data, item.id, item
      state.ids = collection.map (i) -> i.id
    create: (state, item) ->
      if state.ids.indexOf(item.id) > -1
        throw new Error "Tried to create item #{storeName} with already existing id '#{item.id}'. "
      state.ids.push item.id
      Vue.set state.data, item.id, item
    update: (state, item) ->
      if state.ids.indexOf(item.id) == -1
        throw new Error "Tried to update item #{storeName} with non existing id '#{item.id}'. "
      Vue.set state.data, item.id, item
    destroy: (state, item) ->
      index = state.ids.indexOf(item.id)
      if index == -1
        throw new Error "Tried to destroy item #{storeName} with non existing id '#{item.id}'. "
      state.ids.splice index, 1
      delete state.data[item.id]
  actions:
    hydrate: ({ commit }) ->
      api.index()
      .then (res) ->
        commit 'hydrate', res.data
    create: ({ commit }, item) ->
      api.create(item)
      .then (res) ->
        commit 'create', res.data
    update: ({ commit }, item) ->
      api.update(item)
      .then (res) ->
        commit 'update', res.data
    destroy: ({ commit }, item) ->
      api.destroy(item)
      .then (res) ->
        commit 'destroy', res.data
  getters:
    all: (state) -> state.ids.map (id) -> state.data[id]
