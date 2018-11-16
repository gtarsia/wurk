import axios from 'axios'
import Routes from 'misc/routes'

export default ({ resourceName }) ->
  pluralRoute = Routes["#{resourceName}s_path"]
  singularRoute = Routes["#{resourceName}_path"]

  actions =
    index: (q) ->
      axios.get pluralRoute(format: 'json'), params: q
    create: (d) ->
      args = {}
      args[resourceName] = d
      axios.post pluralRoute(format: 'json'), args
    update: (d) ->
      args = {}
      args[resourceName] = d
      axios.put singularRoute(id: d.id, format: 'json'), args
    show: ({ id }) ->
      axios.get singularRoute(id: id, format: 'json')
    destroy: ({ id }) ->
      axios.delete singularRoute(id: id, format: 'json')
  actions
