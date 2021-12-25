# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Admin　管理者アカウント
admin = Admin.new(:email => 'admin@admin.com',:password => 'password')
admin.save!

person = Gimei.name
Staff.create!(
  email: "larry@wiegand-grady.org",
  first_name: person.first.kanji,
  first_name_kana: person.first.katakana,
  last_name: person.last.kanji,
  last_name_kana: person.last.katakana,
  password: 'password',
  password_confirmation: 'password',
  current_sign_in_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
  sign_in_count: 10,
)
# Staff スタッフアカウント
16.times do |n|
  person = Gimei.name
  sign_in_count_array = (1..50).to_a
  Staff.create!(
    email: Faker::Internet.email,
    first_name: person.first.kanji,
    first_name_kana: person.first.katakana,
    last_name: person.last.kanji,
    last_name_kana: person.last.katakana,
    password: 'password',
    password_confirmation: 'password',
    current_sign_in_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
    sign_in_count: sign_in_count_array.sample,
  )
end
3.times do |n|
  person = Gimei.name
  Staff.create!(
    email: Faker::Internet.email,
    first_name: person.first.kanji,
    first_name_kana: person.first.katakana,
    last_name: person.last.kanji,
    last_name_kana: person.last.katakana,
    password: 'password',
    password_confirmation: 'password',
    status: false,
    current_sign_in_at: Faker::Time.between(from: DateTime.now - 30, to: DateTime.now),
  )
end

# Category カテゴリ
Category.create!(
  [
    {id:1, name: "基本店舗情報編"}, #20問
    {id:2, name: "料理編"}, #10問
    {id:3, name: "ワイン編"}, #20問
    {id:4, name: "バリスタ編"}, #0問
    {id:5, name: "バーテンダー編"}, #写真ありの問題、複数選択可能問題 8問
  ]
)

# 基本店舗情報編
questions_basic = [
  {question_text: "IVYとはどういう意味か？",choice1: "蔦",choice2: "山",choice3: "森",choice4: "谷"},
  {question_text: "カフェテラスの大きな木は何の木？",choice1: "けやき",choice2: "桜",choice3: "いちょう",choice4: "もみ"},
  {question_text: "オープンしたのはいつ？",choice1: "2011年12月5日",choice2: "2012年12月5日",choice3: "2012年11月5日",choice4: "2011年5月12日"},
  {question_text: "もともと何の屋敷があったと言われているか？",choice1: "水戸徳川家",choice2: "寺田家",choice3: "織田家",choice4: "武田家"},
  {question_text: "平日のブレックファーストは何時から？",choice1: "8:00",choice2: "7:00",choice3: "7:30",choice4: "6:30"},

  {question_text: "ブレックファーストのL.O.は何時？",choice1: "10:45",choice2: "10:30",choice3: "11:00",choice4: "11:30"},
  {question_text: "ランチは何時から？",choice1: "11:30",choice2: "10:30",choice3: "11:00",choice4: "10:45"},
  {question_text: "平日のランチのL.O.は何時？",choice1: "15:00",choice2: "15:30",choice3: "16:00",choice4: "16:30"},
  {question_text: "土日、祝日のランチのL.O.は何時？",choice1: "16:00",choice2: "15:30",choice3: "15:30",choice4: "17:00"},
  {question_text: "平日ディナーは何時から？",choice1: "18:00",choice2: "17:30",choice3: "17:45",choice4: "17:00"},

  {question_text: "ディナーの食事のL.O.は何時？？",choice1: "22:00",choice2: "23:00",choice3: "21:45",choice4: "22:30"},
  {question_text: "駐車場は2,000円以上の利用で何時間無料か？",choice1: "1時間",choice2: "2時間",choice3: "1.5時間",choice4: "0.5時間"},
  {question_text: "駐車場は5,000円以上の利用で何時間無料か？",choice1: "2時間",choice2: "5時間",choice3: "1時間",choice4: "0.5時間"},
  {question_text: "席数は？",choice1: "200席",choice2: "160席",choice3: "150席",choice4: "220席"},
  {question_text: "個室利用の際にはミニマムチャージが発生するが、平日ランチタイムではいくらか？",choice1: "¥15,000",choice2: "¥30,000",choice3: "¥20,000",choice4: "¥10,000"},

  {question_text: "個室利用の際にはミニマムチャージが発生するが、週末ランチタイムではいくらか？",choice1: "¥30,000",choice2: "¥15,000",choice3: "¥20,000",choice4: "¥10,000"},
  {question_text: "個室利用の際にはミニマムチャージが発生するが、ディナータイムではいくらか？",choice1: "¥40,000",choice2: "¥50,000",choice3: "¥30,000",choice4: "¥20,000"},
  {question_text: "個室利用は何名までなら可能か？",choice1: "10名程度",choice2: "20名程度",choice3: "8名程度",choice4: "特に規定はない"},
  {question_text: "T-site内には喫煙所は何箇所あるか？",choice1: "2箇所",choice2: "1箇所",choice3: "3箇所",choice4: "ない"},
  {question_text: "授乳室はどこにあるか？",choice1: "ボーネルンド店内",choice2: "1号館",choice3: "2号館",choice4: "3号館"},
]

questions_basic.each_with_index do |question,index|
  # 質問文
  Question.create!({id: index + 1,category_id: 1,question_text: question[:question_text]})
  # 選択肢
  Choice.create!([
    { question_id: index + 1, choice_text: question[:choice1], is_answer: true },
    { question_id: index + 1, choice_text: question[:choice2], is_answer: false},
    { question_id: index + 1, choice_text: question[:choice3], is_answer: false},
    { question_id: index + 1, choice_text: question[:choice4], is_answer: false},
  ])
  # 18人分のレートのみ作成
  18.times do |n|
    # 達成率
    AchievementRate.create!([
        { staff_id: n + 1, question_id: index + 1, status: Faker::Boolean.boolean, category_id:1 },
    ])

    # 正答率
    CorrectAnswerRate.create!([
        { staff_id: n + 1, question_id: index + 1, status: Faker::Boolean.boolean ,category_id:1 },
    ])
  end
end


# 料理編
questions_food = [
  {question_text: "カタルーニャでよく用いられるソースの一種。「ニンニク入りマヨネーズ」と説明されることもある。ブイヤベースなどに入っている魚につけて食べることが多い。",
         choice1: "アイオリソース",
         choice2: "チミチョリソース",
         choice3: "ハリサソース",
         choice4: "タプナードソース"},
  {question_text: "ヤギの乳で作ったチーズで、基本的にソフトタイプのチーズをさす総称。フランス語でヤギを意味する。",
         choice1: "シェーブル",
         choice2: "マンチェゴ",
         choice3: "タレッジオ",
         choice4: "フルムダンベール"},
  {question_text: "マンチェゴは、スペインのラ・マンチャ地方を発祥とする、何を原料としたチーズか？",choice1: "羊乳",choice2: "牛乳",choice3: "山羊乳",choice4: "練乳"},
  {question_text: "フルム・ダンベールは、何を原料としたブルーチーズか？",choice1: "牛乳",choice2: "羊乳",choice3: "山羊乳",choice4: "オーツミルク"},
  {question_text: "カラマリとは何か？",choice1: "イカのフライ",choice2: "タコのフライ",choice3: "カニのフライ",choice4: "カキフライ"},

  {question_text: "ボンゴレはイタリア語でなんという意味か？",choice1: "あさり",choice2: "ワイン",choice3: "白",choice4: "二枚貝"},
  {question_text: "ケールとは何か？",choice1: "野菜",choice2: "肉の部位",choice3: "ぶどう品種",choice4: "リキュール"},
  {question_text: "レタス、きゅうり、クレソン、炒めたベーコンなどを使ったサラダに、細かく刻むか、裏ごしして粒状にした茹で卵を振りかけたサラダで、ある花に見えることからその名が付けられたものは？",
         choice1: "ミモザサラダ",choice2: "シーザーサラダ",choice3: "コールスローサラダ",choice4: "コブサラダ"},
  {question_text: "バルサミコ酢の主原料は？",choice1: "ぶどう",choice2: "砂糖",choice3: "小麦",choice4: "米"},
  {question_text: "スピナッチとは何か？",choice1: "ほうれん草",choice2: "小松菜",choice3: "かぶ",choice4: "真鯛"},
]

questions_food.each_with_index do |question,index|
  # 質問文
  Question.create!({id: index + 21,category_id: 2,question_text: question[:question_text]})
  # 選択肢
  Choice.create!([
    { question_id: index + 21, choice_text: question[:choice1], is_answer: true },
    { question_id: index + 21, choice_text: question[:choice2], is_answer: false},
    { question_id: index + 21, choice_text: question[:choice3], is_answer: false},
    { question_id: index + 21, choice_text: question[:choice4], is_answer: false},
  ])
  # 18人分のレートのみ作成
  18.times do |n|
    # 達成率
    AchievementRate.create!([
        { staff_id: n + 1, question_id: index + 21, status: Faker::Boolean.boolean, category_id: 2},
    ])

    # 正答率
    CorrectAnswerRate.create!([
        { staff_id: n + 1, question_id: index + 21, status: Faker::Boolean.boolean ,category_id: 2},
    ])
  end
end

# ワイン編
questions_wine = [
  {question_text: "接待というシーンにおいて、クライアントとの信頼関係を築くことができる重要な場面。（　　　）としてもワインを活用しています。？",
         choice1: "コミュニケーションツール",choice2: "知識",choice3: "嫌がらせ",choice4: "稼ぐため"},
  {question_text: "醸造酒とは…穀物や(　　　)をアルコール発酵させて造ったお酒。ワインやビール、日本酒などのこと。",
         choice1: "果物",choice2: "食物",choice3: "水",choice4: "蒸留酒"},
  {question_text: "(　　　)とは…ガス圧が１気圧以上の発泡性ワインのこと。",
         choice1: "スパークリングワイン",choice2: "赤ワイン",choice3: "白ワイン",choice4: "ロゼワイン"},
  {question_text: "赤ワインの醸造において、収穫された(　  　)はまず除梗破砕し、ブドウの実を果皮や種子ごと発酵槽に入れる。酵母と糖分がアルコール発酵を起こし、ブドウの果皮から色素が抽出されワインに色がつく。",
         choice1: "黒ぶどう",choice2: "赤ぶどう",choice3: "白ぶどう",choice4: "紫ぶどう"},
  {question_text: "（　　　　）とは、ワインに気泡を発生させるため、瓶に詰めるためワインに糖と酵母を溶かしたものを加えて密閉する。瓶の中でもう一度発酵が始まり、炭酸ガスを発生させる。",
         choice1: "瓶内二次発酵",choice2: "瓶内三次発酵",choice3: "デコルジュマン",choice4: "大発酵"},

  {question_text: "(　　　)とは、黒ブドウで白ワインと同様の造り方をすることにより、圧搾した時に果皮から果汁に移る色がロゼになる。",
         choice1: "セニエ法",choice2: "パニエ法",choice3: "直接圧搾法",choice4: "瞬間圧搾法"},
  {question_text: "酵母によるワインのアルコール発酵に該当するものを選んでください。",
         choice1: "糖分がアルコールと炭酸ガスに分解される",choice2: "糖分が乳酸と炭酸ガスに分類される",choice3: "糖分がアルコールとリンゴ酸に分解される",choice4: "糖分がアルコールと乳酸に分解される"},
  {question_text: "醸造工程中にアルコールを添加してワイン全体のアルコール分を高めたワインの事を何と呼ぶか該当するものを選んでください。",
         choice1: "フォーティファイドワイン",choice2: "フレーヴァードワイン",choice3: "スパークリングワイン",choice4: "スティルワイン"},
  {question_text: "シャンパーニュは主要３種類のブドウを含む７品種を使って造られている。主要品種３種類と言われているものをひとつ答えてください。",
         choice1: "ピノノワール",choice2: "カベルネ・ソーヴィニヨン",choice3: "メルロー",choice4: "マルベック"},
  {question_text: "シャンパーニュは主要３種類のブドウを含む７品種を使って造られている。主要品種３種類と言われているものをひとつ答えてください。",
         choice1: "ピノムニエ",choice2: "ピノグリ",choice3: "リースリング",choice4: "カルメネール"},

  {question_text: "シャンパーニュは主要３種類のブドウを含む７品種を使って造られている。主要品種３種類と言われているものをひとつ答えてください。",
         choice1: "シャルドネ",choice2: "ピノブラン",choice3: "プティ・メリエ",choice4: "アルバンヌ"},
  {question_text: "ボルドー地方では重厚かつ調和がとれたワインが特徴で複数の品種を合わせる手法とはどれか該当するものを選んでください。",
         choice1: "アッサンブラージュ",choice2: "セニエ",choice3: "スキンコンタクト",choice4: "シュール・リー"},
  {question_text: "ブルゴーニュ地方のワインについての出題。ボルドーワインと違い単一品種で造るのが一般的です。黒ぶどう品種で有名な品種を選んでください。",
         choice1: "ピノノワール",choice2: "シラー",choice3: "カベルネフラン",choice4: "カベルネ・ソーヴィニヨン"},
  {question_text: "ブルゴーニュ地方のワインについての出題。ボルドーワインと違い単一品種で造るのが一般的です。白ぶどう品種で有名な品種を選んでください。",
         choice1: "シャルドネ",choice2: "リースリング",choice3: "ソーヴィニヨンブラン",choice4: "ヴィオニエ"},
  {question_text: "イタリアでは全土20州でワインが造られていますが、次の中で海に面していない州はどれか該当するものを選んでください。",
         choice1: "ウンブリア",choice2: "マルケ",choice3: "アブルッツォ",choice4: "モリーゼ"},

  {question_text: "ミトロ、ジェスターロゼ、オーストラリアの主要ブドウ品種は？",
         choice1: "サンジョヴェーゼ",choice2: "ピノノワール",choice3: "ネッビオーロ",choice4: "シラーズ"},
  {question_text: "オーストラリアのワインではないものを選んでください。",
         choice1: "ファイヤーストーン",choice2: "プランタジェネット",choice3: "ダッシュウッド",choice4: "デボルトリ"},
  {question_text: "カルフォルニアのワインではないものを選んでください。",
         choice1: "ボールドヒルズ",choice2: "マクマニス",choice3: "スカイサイド",choice4: "チョークヒル"},
  {question_text: "オーストラリアのワインではないものを選んでください。",
         choice1: "クライン",choice2: "ジェセフクローミー",choice3: "ピラミマ",choice4: "カレン"},
  {question_text: "カルフォルニアのワインではないものを選んでください。",
         choice1: "フォーブス＆フォーブス",choice2: "マクマニス",choice3: "アルタマリア",choice4: "ベッドロック"},
]

questions_wine.each_with_index do |question,index|
  # 質問文
  Question.create!({id: index + 31,category_id: 3,question_text: question[:question_text]})
  # 選択肢
  Choice.create!([
    { question_id: index + 31, choice_text: question[:choice1], is_answer: true },
    { question_id: index + 31, choice_text: question[:choice2], is_answer: false},
    { question_id: index + 31, choice_text: question[:choice3], is_answer: false},
    { question_id: index + 31, choice_text: question[:choice4], is_answer: false},
  ])
  # 18人分のレートのみ作成
  18.times do |n|
    # 達成率
    AchievementRate.create!([
        { staff_id: n + 1, question_id: index + 31, status: Faker::Boolean.boolean, category_id:3 },
    ])

    # 正答率
    CorrectAnswerRate.create!([
        { staff_id: n + 1, question_id: index + 31, status: Faker::Boolean.boolean ,category_id:3 },
    ])
  end
end


# バーテンダー編
# 2個正解がある問題
questions_bar = [
  {question_text: "4.5%のALC度数のビールは？",
         choice1: "ペールエール",choice2: "ウィートエール",choice3: "IPA",choice4: "スタウト"},
  {question_text: "4.5%のALC度数のビールは？",
         choice1: "ペールエール",choice2: "アンバーエール",choice3: "IPA",choice4: "スタウト"},
  {question_text: "5%以上のALC度数のビールは？",
         choice1: "IPA",choice2: "スタウト",choice3: "ペールエール",choice4: "ウィートエール"},
  {question_text: "バーボンウィスキーを選んでください。",
         choice1: "ウッドフォードリザーブ",choice2: "ブレットバーボン",choice3: "マッカラン",choice4: "マスターソンズ"},
  {question_text: "ジャパニーズジンを全て選んでください。",
         choice1: "季の美",choice2: "KO MA SA",choice3: "こころ",choice4: "山桜"},
]

questions_bar.each_with_index do |question,index|
  # 質問文
  Question.create!({id: index + 51,category_id: 5,question_text: question[:question_text]})
  # 選択肢
  Choice.create!([
    { question_id: index + 51, choice_text: question[:choice1], is_answer: true },
    { question_id: index + 51, choice_text: question[:choice2], is_answer: true },
    { question_id: index + 51, choice_text: question[:choice3], is_answer: false},
    { question_id: index + 51, choice_text: question[:choice4], is_answer: false},
  ])
  # 18人分のレートのみ作成
  18.times do |n|
    # 達成率
    AchievementRate.create!([
        { staff_id: n + 1, question_id: index + 51, status: Faker::Boolean.boolean, category_id:5 },
    ])

    # 正答率
    CorrectAnswerRate.create!([
        { staff_id: n + 1, question_id: index + 51, status: Faker::Boolean.boolean ,category_id:5 },
    ])
  end
end

# 画像がある問題
questions_bar_image = [
  {question_text: "このシェイカーの名前は？",
           image: File.open('./app/assets/images/boston_shaker.jpg'),
         choice1: "ボストンシェーカー",choice2: "スリーピースシェーカー",choice3: "キャノンシェーカー",choice4: "ニューヨークシェーカー"},

  {question_text: "画像のような飾りのことを別名でなんという？",
           image: File.open('./app/assets/images/garnish.jpg'),
         choice1: "ガーニッシュ",choice2: "ピン",choice3: "ストレイナー",choice4: "スクイーザー"},

  {question_text: "アルコールにハーブやスパイスを漬け込ませることをなんという？",
           image: File.open('./app/assets/images/infusion.jpg'),
         choice1: "インヒュージョン",choice2: "ピール",choice3: "シェイク",choice4: "ビルド"},
]

questions_bar_image.each_with_index do |question,index|
  # 質問文
  Question.create!({id: index + 56,category_id: 5,question_text: question[:question_text],image: question[:image]})
  # 選択肢
  Choice.create!([
    { question_id: index + 56, choice_text: question[:choice1], is_answer: true },
    { question_id: index + 56, choice_text: question[:choice2], is_answer: false},
    { question_id: index + 56, choice_text: question[:choice3], is_answer: false},
    { question_id: index + 56, choice_text: question[:choice4], is_answer: false},
  ])
  # 18人分のレートのみ作成
  18.times do |n|
    # 達成率
    AchievementRate.create!([
        { staff_id: n + 1, question_id: index + 56, status: Faker::Boolean.boolean, category_id:5 },
    ])

    # 正答率
    CorrectAnswerRate.create!([
        { staff_id: n + 1, question_id: index + 56, status: Faker::Boolean.boolean ,category_id:5 },
    ])
  end
end
