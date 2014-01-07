angular.module("mobile-angular-ui.directives.scrollable", [])
.directive "scrollable", ->
  replace: false
  restrict: "C"
  link: (scope, element, attr) ->
    setTimeout (->
      [].slice.call(document.querySelectorAll("input, select, button, textarea")).forEach (el) ->
        el.addEventListener (if ("ontouchstart" of window) then "touchstart" else "mousedown"), (e) ->
          console.log "Preventing event from bubbling up to iScroll, as it would then remove it."
          e.stopPropagation()

      iscroll = new iScroll(element[0], {wheelAction: 'scroll', checkDOMChanges: true})
    ), 200
