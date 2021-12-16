/* global $*/

// 問題選択後、ボタンのdisabledを外す
// $(document).on('turbolinks:load',function () {


  $('.choice').change(function() {
    $('#answer_btn').prop('disabled', false);
    $('#answer_btn').removeClass("btn-disabled");
    $('#answer_btn').addClass("btn-success");

  });

// });