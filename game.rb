require_relative "rulu.rb"

class Game
  puts "ブラックジャックゲームを開始します"
  # ゲームを用意
  blackjack = Blackjack.new
  #山札を作成
  deck = Deck.new
  #プレイヤーとディーラーにカードを2枚配る
  player, dealer = blackjack.start_game(deck)
  # プレイヤーのターンでカードを引くか勝負するか選ぶ
  continuation = blackjack.player_turn(player, deck)
  # プレイヤーのターン終了後にバーストしてなかったら(continuation?がtrue)ゲーム続行
  if continuation
    #ディーラーのターンでカードを引く
    blackjack.dealer_turn(dealer, deck)
    #勝負の判定
    blackjack.judge(player, dealer)
  end
end

game = Game.new