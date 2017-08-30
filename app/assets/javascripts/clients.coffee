jQuery ->
  $("#query").autocomplete(
    source: "/clients/autocomplete",
    minLength: 2
  )