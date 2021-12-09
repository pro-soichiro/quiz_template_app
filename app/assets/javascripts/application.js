// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require Chart.min
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


$(document).ready(function () {
  // 問題選択後、ボタンのdisabledを外す
  {
    $('.choice').change(function() {
      $('#answer_btn').prop('disabled', false);
    });
  }

  // 問題作成時、選択肢の入力フォーム数を変更できる処理
  {
    function input_form(index) {
      const html = `<td>
                      <input  placeholder="選択肢を入力してください"
                              type="text"
                              name="form_question[choices_attributes][${index}][choice_text]"
                              id="form_question_choices_attributes_${index}_choice_text">
                      <input  name="form_question[choices_attributes][${index}][is_answer]"
                              type="hidden"
                              value="0">
                      <input  type="checkbox"
                              value="1"
                              name="form_question[choices_attributes][${index}][is_answer]"
                              id="form_question_choices_attributes_${index}_is_answer">
                    </td>`;
      return html;
    }


    let input_index = gon.choice_index;

    function check_input_index(input_index){
      if (input_index == 2) {
        $('#remove_choice_btn').toggleClass("hidden");
      }
    }

    $('#add_choice_btn').click(function() {
      $('#tr_parent_node').append(input_form(input_index));
      check_input_index(input_index);
      input_index += 1;
      console.log(input_index);
    });


    $('#remove_choice_btn').click(function() {
      $('td:last-child').remove();
      input_index -= 1;
      check_input_index(input_index);
      console.log(input_index);
    });

  }

});