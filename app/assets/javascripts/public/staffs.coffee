# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.draw_graph = ->
  ctx = document.getElementById("myChart").getContext('2d')

  type = 'horizontalBar'
  data = {
    labels: gon.categories,
    datasets: [{
      label: '達成',
      data: gon.myARates,
      backgroundColor: [],
      borderWidth: 1,
      borderColor: []
    },{
      label: '残り',
      data: gon.myARatesMinus
    }]
  }
  options = {
    scales: {
      xAxes: [{
        scaleLabel: {
          display: true,
          labelString: '単位[%]',
        },
        ticks: {
          min: 0,
          max: 100,
          stepSize: 10
        },
        stacked: true,
      }],
      yAxes: [{
        scaleLabel: {
          display: true,
          labelString: 'カテゴリ',
        },
        stacked: true
      }]
    }
  }


  for i in gon.myARates
    if i < 25
      data.datasets[0].backgroundColor.push('rgba(215,236,250,0.8)')
      data.datasets[0].borderColor.push('#81C4F2')
    else if 26 < i < 50
      data.datasets[0].backgroundColor.push('rgba(255,212,228,0.8)')
      data.datasets[0].borderColor.push('#FF82B2')
    else if 51 < i < 75
      data.datasets[0].backgroundColor.push('rgba(255,235,216,0.8)')
      data.datasets[0].borderColor.push('#FFAE60')
    else if i is 100
      data.datasets[0].backgroundColor.push('rgba(214,236,214,0.8)')
      data.datasets[0].borderColor.push('#37A236')

  myChart = new Chart(ctx, {
    type: type,
    data: data,
    options: options
  })

