require_relative "myself.rb"
require_relative "dealer.rb"

# それぞれのゲームの動きの処理
class Blackjack
  # ディーラーとプレイヤーの最初の2枚を配る流れ
  def start_game(deck)
    player = Player.new
    dealer = Dealer.new
    #プレイヤーとディーラーに2枚ずつカードを配る
    player.player_draw_card(deck, 2)
    dealer.dealer_draw_card(deck, 2)
    # プレイヤーとディーラーのインスタンスを返す
    return player, dealer
  end

  # playerとdeckのインスタンスを引数にして渡して手札と山札を操作する
  # プレイヤーのターンで引くか引かないかループ処理
  def player_turn(player, deck)
    # プレイヤーの得点を表示
    puts "あなたのターンです"
    puts "あなたの現在の得点は#{player.current_score}点です"
    loop do
      # 22点以上だったら即座に負けてゲームを終了
      if player.current_score >= 22
        puts "残念！バーストしました！"
        puts ""
        puts "あなたの負けです"
        puts "ゲームを終了します"
        #ゲーム続行の為に真偽値を渡す
        return false
        break
      end

      puts "カードを引きますか（Y/N）？"
      draw_answer = gets.chomp
      
      #upcaseによりyでも大文字のYに変換
      if draw_answer.upcase == "Y"
        puts ""
        # Yなので1枚引く
        player.player_draw_card(deck, 1)
        puts "あなたの現在の得点は#{player.current_score}点です"
      elsif draw_answer.upcase == "N"
        puts "承知しました"
        puts ""
        puts "他のプレイヤーのターンになります"
        break
      else
        puts ""
        puts "YかNで入力ください"
      end
    end
    #バーストしてなかったらゲーム続行としてtrueとして真偽値を渡す
    return true
  end

  # playerとdeckのインスタンスを引数にして渡して手札と山札を操作する
  # ディーラーの得点が17以上になるまで引き続ける
  def dealer_turn(dealer, deck)
    # dealer.current_scoreが17以上になるまで引き続けループ処理
    puts ""
    puts "ディーラーのターンです"
    loop do
      dealer.dealer_draw_card(deck, 1)
      # 17以上になったら処理を終了
      break if dealer.current_score >= 17
    end
    puts ""
  end

  # プレイヤーとディーラーの得点を比較して21に近い方を判定する
  def judge(player, dealer)
    puts "勝敗を判定します"
    puts ""
    player_score = player.current_score
    dealer_score = dealer.current_score
    if dealer_score > 21
      puts "ディーラーの得点は#{dealer_score}点でバーストしました!!"
      puts "おめでとうございます！あなたの勝ちです"
    elsif player_score > 21
      puts "あなたの得点が21を超えたため、ディーラーの勝ちです!!"
    elsif dealer_score > player_score
      puts "ディーラーの得点は#{dealer_score}点でした"
      puts "残念！ディーラーの得点があなたよりも高いため、あなたの負けです!!"
    elsif dealer_score < player_score
      puts "ディーラーの得点は#{dealer_score}点でした"
      puts "おめでとうございます！あなたの得点がディーラーを上回ったため、あなたの勝ちです！!"
    else
      puts "ディーラーの得点は#{dealer_score}点でした"
      puts "惜しかったです！引き分けです！"
    end
  end
  
end
