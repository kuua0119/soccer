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

Admin.create!(email: "admin@example.com", password: "123456")
