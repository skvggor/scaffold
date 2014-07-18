Site = {}

Site.apps =
  # myFn description
  myFn: ->
    console.log 'Running...'

do ->
  Site.apps.myFn()
  return
