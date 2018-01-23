---
---

chart_json = {{ site.data.charts.simulations | jsonify }}
div_id="#simulation_chart"

on_click = (event, item) ->
  if not item
    return
  if ((item.mark.marktype is 'image') or (item.mark.marktype is 'rect') or (item.mark.marktype is 'text'))
    link = item.mark.group.datum.link
    window.location = "{{ site.baseurl }}/simulations/" + link

build_chart = (chart_json)->
  view = new vega.View(vega.parse(chart_json))
    .initialize(div_id)
    .renderer('svg')
    .hover()
    .run()
  view.addEventListener('click', on_click)

build_chart(chart_json)
