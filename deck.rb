require_relative "card.rb"

# デッキのクラスを作成
class Deck
  #用意した絵柄と数字で計52通りのカードをセット
  def initialize
    @cards = []
      # 二重のeach ループによって、NUMBERの要素(13)とMARKの要素(4)を掛けた52通りのカードを生成
      Card::NUMBER.each do |number|
        Card::MARK.each do |mark|
          #すべての組合せに対してのカードクラスのインスタンスを生成
          #数字と絵柄を引数として渡している
          @cards << Card.new(number, mark)
          #52枚生成し、それらのカードをシャッフルして、山札として扱うCardクラスのオブジェクトを格納するため、[number,mark]だと不可
        end
      end
      # @card << Card.new(number, mark)をeach文の外にしてしまうとループの最後の1枚だけしか生成されない
    #セットしたらシャッフル
    @cards.shuffle!
  end

  #引いた数の分だけ要素を削除
  def draw_card(draw)
    @cards.pop(draw)
  end
end
