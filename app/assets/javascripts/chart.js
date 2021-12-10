/* global $*/
/* global gon*/
/* global Chart*/

// document.addEventListener("turbolinks:load", function() {
  document.addEventListener('DOMContentLoaded',function(){

    var categories = gon.categories;
    var myARates = gon.myARates;
    var myARatesMinus = gon.myARatesMinus;
    var bgc = [];
    var bdc = [];

    if (typeof myChart !== 'undefined' && myChart) {
      myChart.destroy();
    }

    myARates.forEach( i => {
      // 0以上25以下 pink
      if ( i >= 0 && i <= 25 ) {
        bgc.push('rgba(255,212,228,0.8)');
        bdc.push('#FF82B2');
      // 26以上70以下 orange
      } else if (i >= 26 && i <= 70) {
        bgc.push('rgba(255,235,216,0.8)');
        bdc.push('#FFAE60');
      // 71以上99以下 blue
      } else if (i >= 71 && i <= 99) {
        bgc.push('rgba(215,236,250,0.8)');
        bdc.push('#81C4F2');
      // 100 green
      } else if ( i == 100 ) {
        bgc.push('rgba(214,236,214,0.8)');
        bdc.push('#37A236');
      };
    });

    var ctx = document.getElementById("myChart").getContext('2d');

    var myChart = new Chart(ctx, {
      type: 'horizontalBar',
      data: {
        labels: categories,
        datasets: [{
          label: '達成',
          data: myARates,
          backgroundColor: bgc,
          borderWidth: 1,
          borderColor: bdc
        },{
          label: '残り',
          data: myARatesMinus
        }]
      },
      options: {
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
    });
  });
// });