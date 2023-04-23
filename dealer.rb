require_relative "deck.rb"

#ディーラーのクラスを作成
class Dealer
  attr_reader :cards
  def initialize
    #プレイヤーのカードは0枚
    @cards = []
    @draw_count = 0
  end

  #Aが21に近かったら21そうでなかったら1を返す
  def best_ace
    if current_score + 11 <= 21
      11
    else
      1
    end
  end

  # デッキからカードを引く
  # デッキのインスタンス(deck)が引数
  def dealer_draw_card(deck, num)
    #デッキからカードを取得( (draw)⇨(num) )
    card = deck.draw_card(num)
    #取得したカードを手札に加える
    @cards += card
    #1枚目の引いたカードを出力するが2枚目以降の引いたカードは出力しない
    card.each_with_index do |draw, i|
      if draw.number == "A"
        # best_aceはメソッド
        best_ace_number = best_ace
        draw.instance_variable_set(:@number, best_ace_number)
      end
      # @draw_countが0の時だけカードを表示す
      if @draw_count == 0
        puts "ディーラーは#{draw.number}の#{draw.mark}を引きました" 
      else
        puts "ディーラーはカードを引きました"
      end
      # カードを引いた回数をカウントする
      @draw_count += 1
    end
  end

  def current_score
    #card.scoreが使われている理由はCardクラスのscoreメソッドを呼び出して、カードの得点を取得するため
    @cards.inject(0) { |sum, card| sum + card.score }
  end

end