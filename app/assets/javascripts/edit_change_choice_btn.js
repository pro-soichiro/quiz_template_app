/* global $*/
/* global gon*/

// 問題作成時、選択肢の入力フォーム数を変更できる処理

$(document).on('turbolinks:load',function () {

  function input_form(index) {
    const html =  `<tr>
          					<td></td>
          					<td>
            					<input name="question[choices_attributes][${index}][is_answer]"
            					       type="hidden"
            					       value="0">
            					<input type="checkbox"
            					       value="1"
            					       name="question[choices_attributes][${index}][is_answer]"
            					       id="question_choices_attributes_${index}_is_answer">
          					</td>
          				  <td>
          				    <input placeholder="選択肢を入力してください"
          				           type="text"
          				           name="question[choices_attributes][${index}][choice_text]"
          				           id="question_choices_attributes_${index}_choice_text">
          				  </td>
          			    <td></td>
          				</tr>`;
    return html;
  }

  // idやinputを作るための変数
  let input_index = gon.choice_index;

  // デフォルトで消す
  function hidden() {
    $('#remove_choice_btn').addClass("hidden");
  }
  hidden();


  function check_input_index(input_index){
    if (input_index == gon.choice_index ) {
      $('#remove_choice_btn').toggleClass("hidden");
    }
  }

  $('#add_choice_btn').click(function() {
    $('tr:last').before(input_form(input_index));
    check_input_index(input_index);
    input_index += 1;
  });


  $('#remove_choice_btn').click(function() {
    $('tr:nth-last-child(2)').remove();
    input_index -= 1;
    check_input_index(input_index);
  });



});

