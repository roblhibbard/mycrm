jQuery ->
  $("#q").autocomplete(
    source: "/dispatches/autocomplete",
    minLength: 2
  )
