
[1mFrom:[0m /home/ec2-user/environment/quiz_template_app/app/controllers/public/staffs_controller.rb:28 Public::StaffsController#show:

     [1;34m8[0m: [32mdef[0m [1;34mshow[0m
     [1;34m9[0m:   gon.categories = [1;34;4mCategory[0m.pluck([33m:name[0m).map(&[33m:to_s[0m)
    [1;34m10[0m: 
    [1;34m11[0m:   [1;34m# 解答済みの問題[0m
    [1;34m12[0m:   [1;34m# gon.answered = [][0m
    [1;34m13[0m:   [1;34m# gon.categories.length.times do[0m
    [1;34m14[0m:   [1;34m#   gon.answered << rand(100.0)[0m
    [1;34m15[0m:   [1;34m# end[0m
    [1;34m16[0m:   gon.answered = [1;34;4mAchievementRate[0m.where([35mstaff_id[0m: [1;34m2[0m).count
    [1;34m17[0m: 
    [1;34m18[0m:   [1;34m# 未解答の問題[0m
    [1;34m19[0m:   [1;34m# gon.unanswered = [][0m
    [1;34m20[0m:   [1;34m# gon.unanswered = gon.answered.map {|i| 100 - i }[0m
    [1;34m21[0m: 
    [1;34m22[0m:   [1;34m# 問題数(MAX)[0m
    [1;34m23[0m:   @questions = [1;34;4mQuestion[0m.all
    [1;34m24[0m:   gon.all_questions = @questions.count
    [1;34m25[0m:   [1;34m# gon.total = 100[0m
    [1;34m26[0m: 
    [1;34m27[0m:   gon.unanswered = ( gon.all_questions.to_i - gon.answered.to_i )
 => [1;34m28[0m:   binding.pry
    [1;34m29[0m: [32mend[0m

