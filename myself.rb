require_relative "deck.rb"

#player(自分)のクラスを作成
class Player
  attr_reader :cards
  def initialize
    #プレイヤーのカードは0枚
    @cards = []
  end

  # デッキからカードを引く
  # デッキのインスタンス(deck)が引数
  def player_draw_card(deck, num)
    #デッキからカードを取得( (draw)⇨(num) )
    card = deck.draw_card(num)
    #取得したカードを手札に加える
    @cards += card
    #取得したカードを出力する
    card.each do |draw|
      puts "あなたは#{draw.number}の#{draw.mark}を引きました"
      #Aを引いたときの処理
      if draw.number == 'A'
        puts "Aを引きました。1か11のどちらにしますか？ (1/11)"
        ace_choice= gets.chomp.to_i
        # 1か11が入力されなかった場合の処理
        while ace_choice != 1 && ace_choice != 11
          puts "1か11のどちらかを入力してください。"
          ace_choice = gets.chomp.to_i
        end
        # 選択された値(ace_choice)でAの値を置き換える
        # インスタンス変数の@numberにace_choiceの値を設定
        draw.instance_variable_set(:@number, ace_choice)
      end
    end
  end

  def current_score
    #card.scoreが使われている理由はCardクラスのscoreメソッドを呼び出して、カードの得点を取得するため
    @cards.inject(0) { |sum, card| sum + card.score }
  end
end