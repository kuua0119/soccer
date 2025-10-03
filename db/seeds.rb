users = User.create!(
  [
    { 
      name: "浜田", 
      email: "hamada@example.com", 
      password: "123456",
      introduction: "サッカー観戦が趣味です！バルセロナファン。",
    },
    { 
      name: "米田", 
      email: "yoneda@example.com", 
      password: "123456",
      introduction: "リヴァプール推しです！週末はフットサルしています。",
    },
    { 
      name: "山本", 
      email: "suzuki@example.com", 
      password: "123456",
      introduction: "海外サッカーをよく見ます。特にブンデスリーガ。",
    },
    { 
      name: "坂本", 
      email: "sakamoto@example.com", 
      password: "123456",
      introduction: "プレミアリーグが好きです。アーセナルサポーター。",
    }
  ]
)

users[0].avatar.attach(io: File.open(Rails.root.join("app/assets/images/user1.jpg")), filename: "user1.jpg")
users[1].avatar.attach(io: File.open(Rails.root.join("app/assets/images/user2.jpg")), filename: "user2.jpg")
users[2].avatar.attach(io: File.open(Rails.root.join("app/assets/images/user3.jpg")), filename: "user3.jpg")
users[3].avatar.attach(io: File.open(Rails.root.join("app/assets/images/user4.jpg")), filename: "user4.jpg")

clubs = [
  { name: "FCバルセロナ", league: "ラ・リーガ", country: "スペイン" },
  { name: "レアル・マドリード", league: "ラ・リーガ", country: "スペイン" },
  { name: "アトレティコ・マドリード", league: "ラ・リーガ", country: "スペイン" },
  { name: "マンチェスター・ユナイテッド", league: "プレミアリーグ", country: "イングランド" },
  { name: "マンチェスター・シティ", league: "プレミアリーグ", country: "イングランド" },
  { name: "リヴァプール", league: "プレミアリーグ", country: "イングランド" },
  { name: "チェルシー", league: "プレミアリーグ", country: "イングランド" },
  { name: "アーセナル", league: "プレミアリーグ", country: "イングランド" },
  { name: "トッテナム", league: "プレミアリーグ", country: "イングランド" },
  { name: "バイエルン・ミュンヘン", league: "ブンデスリーガ", country: "ドイツ" },
  { name: "ボルシア・ドルトムント", league: "ブンデスリーガ", country: "ドイツ" },
  { name: "パリ・サンジェルマン", league: "リーグ・アン", country: "フランス" },
  { name: "ユヴェントス", league: "セリエA", country: "イタリア" },
  { name: "ACミラン", league: "セリエA", country: "イタリア" },
  { name: "インテル・ミラノ", league: "セリエA", country: "イタリア" },
  { name: "ナポリ", league: "セリエA", country: "イタリア" },
  { name: "アヤックス", league: "エールディヴィジ", country: "オランダ" }
]

clubs.each do |club|
  Club.find_or_create_by!(name: club[:name]) do |c|
    c.league = club[:league]
    c.country = club[:country]
  end
end

community1 = Community.create!(
  club: Club.find_by(name: "FCバルセロナ"),
  community_name: "バルセロナを応援しよう",
  introduction: "FCバルセロナの情報や試合の感想を共有しましょう！",
  user: users[2] 
)
community1.image.attach(
  io: File.open(Rails.root.join("app/assets/images/barcelona.jpg")),
  filename: "barcelona.jpg"
)
community1.users << users[2]

community2 = Community.create!(
  club: Club.find_by(name: "チェルシー"),
  community_name: "チェルシーしか勝たん",
  introduction: "チェルシーサポーター大歓迎！他サポも参加OK⚽",
  user: users[1] 
)
community2.image.attach(
  io: File.open(Rails.root.join("app/assets/images/chelsea.jpg")),
  filename: "chelsea.jpg"
)
community2.users << users[1]

community3 = Community.create!(
  club: Club.find_by(name: "アーセナル"),
  community_name: "アーセナルグループ",
  introduction: "グーナー大歓迎！アーセナル応援しましょう！",
  user: users[3] 
)
community3.image.attach(
  io: File.open(Rails.root.join("app/assets/images/arsenal.jpg")),
  filename: "arsenal.jpg"
)
community3.users << users[3]

community4 = Community.create!(
  club: Club.find_by(name: "ACミラン"),
  community_name: "ミラン応援グループ",
  introduction: "ようこそ！ミラニスタ大歓迎！",
  user: users[0] 
)
community4.image.attach(
  io: File.open(Rails.root.join("app/assets/images/milan.jpg")),
  filename: "milan.jpg"
)
community4.users << users[0]

# --- 投稿作成 ---
post1 = Post.create!(
  title: "バイエルン優勝おめでとう！",
  body: "バイエルン優勝おめでとう！",
  user: users[0], 
)
post1.image.attach(
  io: File.open(Rails.root.join("app/assets/images/bayern.jpg")),
  filename: "bayern.jpg"
)

post2 = Post.create!(
  title: "アーセナル勝利！",
  body: "アーセナルやっぱ強い！",
  user: users[1], 
)
post2.image.attach(
  io: File.open(Rails.root.join("app/assets/images/arsenal2.jpg")),
  filename: "arsenal2.jpg"
)

post3 = Post.create!(
  title: "レアルマドリード勝利！",
  body: "レアルマドリードやべえ！",
  user: users[2], 
)
post3.image.attach(
  io: File.open(Rails.root.join("app/assets/images/real madrid.jpg")),
  filename: "real madrid.jpg"
)

post4 = Post.create!(
  title: "カンプノウ行ってきた！",
  body: "バルセロナ旅行最高でした！",
  user: users[3], 
)
post4.image.attach(
  io: File.open(Rails.root.join("app/assets/images/kanpunou.jpg")),
  filename: "kanpunou.jpg"
)

Admin.create!(email: "admin@example.com", password: "123456")
