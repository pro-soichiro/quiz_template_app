# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin　管理者アカウント
admin = Admin.new(:email => 'admin@admin.com',:password => 'admin1234')
admin.save!

# Staff スタッフアカウント
# Man Sample
5.times do |n|
  Staff.create!(
    email: "staff_email#{n + 1}@staff.com",
    password: "staffpw#{n + 1}",
    last_name: "山本#{n + 1}",
    first_name: "太郎#{n + 1}",
    last_name_kana: "ヤマモト",
    first_name_kana: "タロウ",
    current_sign_in_at: 'Sat, 13 Jun 2020 05:56:48 UTC +00:00'
  )
end
# Lady Sample
5.times do |n|
  Staff.create!(
    email: "staff_email#{n + 6}@staff.com",
    password: "staffpw#{n + 6}",
    last_name: "鈴木#{n + 6}",
    first_name: "花子#{n + 6}",
    last_name_kana: "スズキ",
    first_name_kana: "ハナコ",
    current_sign_in_at: 'Sat, 13 Jun 2020 05:56:48 UTC +00:00'
  )
end

# Category カテゴリ
Category.create!(
  [
    {name: "基本店舗情報編"},
    {name: "料理編"},
    {name: "ワイン編"},
    {name: "バリスタ編"},
    {name: "バーテンダー編"},
    {name: "英語編"}
  ]
)


# 問題
Question.create!(
  [
    {id: 1,category_id: 1,question_text: "IVYとはどういう意味か？"},
    {id: 2,category_id: 1,question_text: "オープンしたのはいつ？"},
    {id: 3,category_id: 1,question_text: "カフェテラスの大きな木は何の木？"},
    {id: 4,category_id: 1,question_text: "もともと何の屋敷があったか？"},
    {id: 5,category_id: 1,question_text: "平日のブレックファーストは何時から？"},
    {id: 6,category_id: 1,question_text: "ブレックファーストのL.O.は何時？"},
    {id: 7,category_id: 1,question_text: "ランチは何時から？"},
    {id: 8,category_id: 1,question_text: "平日のランチのL.O.は何時？"},
    {id: 9,category_id: 1,question_text: "平日ディナーは何時から？"},
    {id: 10,category_id: 1,question_text: "ディナーの食事のL.O.は何時？"},
    {category_id: 1,question_text: "駐車場は2,000円以上の利用で何時間無料か？"},
    {category_id: 1,question_text: "駐車場は5,000円以上の利用で何時間無料か？"},
    {category_id: 2,question_text: "カタルーニャでよく用いられるソースの一種。「ニンニク入りマヨネーズ」と説明されることもある。ブイヤベースなどに入っている魚につけて食べることが多い。"},
    {category_id: 2,question_text: "ヤギの乳で作ったチーズで、基本的にソフトタイプのチーズをさす総称。フランス語でヤギを意味する。"},
    {category_id: 2,question_text: "マンチェゴは、スペインのラ・マンチャ地方を発祥とする、何を原料としたチーズか？"},
    {category_id: 2,question_text: "フルム・ダンベールは、何を原料としたブルーチーズか？"},
    {category_id: 2,question_text: "カラマリとは何か？"},
    {category_id: 3,question_text: "このグラスは何グラスか？",image: File.open('./app/assets/images/Bourgogne.jpg')},
    {category_id: 5,question_text: "このシェイカーは？",image: File.open('./app/assets/images/boston_shaker.jpg')},
    {category_id: 5,question_text: "このシェイカーは？",image: File.open('./app/assets/images/3p_shaker.jpg')},
    {category_id: 5,question_text: "この器具の名前は？",image: File.open('./app/assets/images/bar_spoon.jpg')},
  ]
)

# 選択肢
Choice.create!(
  [
    { question_id: 1,choice_text: "蔦",is_answer: true },
    { question_id: 1,choice_text: "山",is_answer: false},
    { question_id: 1,choice_text: "森",is_answer: false},
    { question_id: 1,choice_text: "谷",is_answer: false},

    { question_id: 2,choice_text: "2011年12月5日",is_answer: true},
    { question_id: 2,choice_text: "2012年12月5日",is_answer: false},
    { question_id: 2,choice_text: "2012年11月5日",is_answer: false},
    { question_id: 2,choice_text: "2011年5月12日",is_answer: false},

    { question_id: 3,choice_text: "けやき",is_answer: true},
    { question_id: 3,choice_text: "桜",is_answer: false},
    { question_id: 3,choice_text: "いちょう",is_answer: false},
    { question_id: 3,choice_text: "もみ",is_answer: false},

    { question_id: 4,choice_text: "水戸徳川家",is_answer: true},
    { question_id: 4,choice_text: "寺田家",is_answer: false},
    { question_id: 4,choice_text: "織田家",is_answer: false},
    { question_id: 4,choice_text: "武田家",is_answer: false},

    { question_id: 5,choice_text: "8:00",is_answer: true},
    { question_id: 5,choice_text: "7:00",is_answer: false},
    { question_id: 5,choice_text: "7:30",is_answer: false},
    { question_id: 5,choice_text: "6:30",is_answer: false},

    { question_id: 6,choice_text: "10:45",is_answer: true},
    { question_id: 6,choice_text: "10:30",is_answer: false},
    { question_id: 6,choice_text: "11:00",is_answer: false},
    { question_id: 6,choice_text: "11:30",is_answer: false},

    { question_id: 7,choice_text: "11:30",is_answer: true},
    { question_id: 7,choice_text: "10:30",is_answer: false},
    { question_id: 7,choice_text: "11:00",is_answer: false},
    { question_id: 7,choice_text: "10:45",is_answer: false},

    { question_id: 8,choice_text: "15:00",is_answer: true},
    { question_id: 8,choice_text: "15:30",is_answer: false},
    { question_id: 8,choice_text: "16:00",is_answer: false},
    { question_id: 8,choice_text: "16:30",is_answer: false},

    { question_id: 9,choice_text: "18:00",is_answer: true},
    { question_id: 9,choice_text: "17:30",is_answer: false},
    { question_id: 9,choice_text: "17:00",is_answer: false},
    { question_id: 9,choice_text: "18:30",is_answer: false},

    { question_id: 10,choice_text: "22:00",is_answer: true},
    { question_id: 10,choice_text: "22:30",is_answer: false},
    { question_id: 10,choice_text: "21:45",is_answer: false},
    { question_id: 10,choice_text: "22:15",is_answer: false},

    { question_id: 11,choice_text: "1時間",is_answer: true},
    { question_id: 11,choice_text: "2時間",is_answer: false},
    { question_id: 11,choice_text: "1.5時間",is_answer: false},
    { question_id: 11,choice_text: "0.5時間",is_answer: false},

    { question_id: 12,choice_text: "2時間",is_answer: true},
    { question_id: 12,choice_text: "5時間",is_answer: false},
    { question_id: 12,choice_text: "1時間",is_answer: false},
    { question_id: 12,choice_text: "0.5時間",is_answer: false},

    { question_id: 13,choice_text: "アイオリソース",is_answer: true},
    { question_id: 13,choice_text: "チミチョリソース",is_answer: false},
    { question_id: 13,choice_text: "ハリサソース",is_answer: false},
    { question_id: 13,choice_text: "タプナードソース",is_answer: false},

    { question_id: 14,choice_text: "シェーブル",is_answer: true},
    { question_id: 14,choice_text: "マンチェゴ",is_answer: false},
    { question_id: 14,choice_text: "タレッジオ",is_answer: false},
    { question_id: 14,choice_text: "カマンベール",is_answer: false},
    { question_id: 14,choice_text: "フルムダンベール",is_answer: false},

    { question_id: 15,choice_text: "羊乳",is_answer: true},
    { question_id: 15,choice_text: "牛乳",is_answer: false},
    { question_id: 15,choice_text: "山羊乳",is_answer: false},
    { question_id: 15,choice_text: "練乳",is_answer: false},

    { question_id: 16,choice_text: "牛乳",is_answer: true},
    { question_id: 16,choice_text: "羊乳",is_answer: false},
    { question_id: 16,choice_text: "山羊乳",is_answer: false},

    { question_id: 17,choice_text: "イカのフライ",is_answer: true},
    { question_id: 17,choice_text: "タコのフライ",is_answer: false},
    { question_id: 17,choice_text: "カニのフライ",is_answer: false},
    { question_id: 17,choice_text: "カキフライ",is_answer: false},

    { question_id: 18,choice_text: "Bourgogne",is_answer: true},
    { question_id: 18,choice_text: "Champagne",is_answer: false},
    { question_id: 18,choice_text: "Bordeaux",is_answer: false},
    { question_id: 18,choice_text: "Riesling",is_answer: false},

    { question_id: 19,choice_text: "ボストンシェーカー",is_answer: true},
    { question_id: 19,choice_text: "ツーピースシェーカー",is_answer: true},
    { question_id: 19,choice_text: "ダブルシェーカー",is_answer: false},
    { question_id: 19,choice_text: "ツインシェーカー",is_answer: false},
    { question_id: 19,choice_text: "キャノンシェーカー",is_answer: false},

    { question_id: 20,choice_text: "スリーピースシェーカー",is_answer: true},
    { question_id: 20,choice_text: "ボストンシェーカー",is_answer: false},
    { question_id: 20,choice_text: "ショートシェーカー",is_answer: false},
    { question_id: 20,choice_text: "ジャパニーズシェーカー",is_answer: false},

    { question_id: 21,choice_text: "バースプーン",is_answer: true},
    { question_id: 21,choice_text: "マドラー",is_answer: false},
    { question_id: 21,choice_text: "ラドラー",is_answer: false},
    { question_id: 21,choice_text: "アドラー",is_answer: false},
  ]
)

# AchievementRate
AchievementRate.create!(
  [
    { staff_id: 1,question_id: 1 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 2 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 3 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 4 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 5 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 6 ,status: true,category_id:1 },
  ]
)
# 10.times do |n|
#   AchievementRate.create!(
#     [
#       10.times do |l|
#         { staff_id: n + 1, question_id: l + 1, status: true, category_id: 1 }
#       end,
#       4.times do |l|
#         { staff_id: n+1,question_id: 13+l,status: true,category_id:2 }
#       end,
#       3.times do |l|
#         { staff_id: n+1,question_id: 19+l,status: true,category_id:5 }
#       end,
#     ]
#   )
# end

# CorrectAnswerRate
CorrectAnswerRate.create!(
  [
    { staff_id: 1,question_id: 1 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 2 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 3 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 4 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 5 ,status: true,category_id:1 },
    { staff_id: 1,question_id: 6 ,status: true,category_id:1 },
  ]
)
# 10.times do |n|
#   CorrectAnswerRate.create!(
#     [
#       10.times do |l|
#         { staff_id: n+1,question_id: l+1,status: true,category_id:1 }
#       end,
#       4.times do |l|
#         { staff_id: n+1,question_id: 13+l,status: false,category_id:2 }
#       end,
#       3.times do |l|
#         { staff_id: n+1,question_id: 19+l,status: true,category_id:5 }
#       end,
#     ]
#   )
# end

