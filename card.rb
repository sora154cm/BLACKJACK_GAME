# カードのクラスを作成
class Card
  #カードの数字と絵柄のパターンを用意
  NUMBER = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']
  MARK = ['スペード','ダイヤ','ハート','クローバー']

  attr_reader :number, :mark
  def initialize(number, mark)
    @number = number
    @mark = mark
  end

  #絵柄のカードを数値に変換して計算できるようにする
  def score
    #if文の条件が真であれば、その数値をそのままreturn文で返す
    #retrunはその場で処理が終了するため
    return @number.to_i if @number.to_i > 0
    #偽(絵柄)の場合、以下の文へ続行する
    case @number
    when "J" then 10
    when "Q" then 10
    when "K" then 10
    when "A" then 1
    end
  end
end