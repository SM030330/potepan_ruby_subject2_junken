require 'readline'

# じゃんけん
@jan_value = ["グー", "チョキ", "パー"]

def junken
  puts "じゃんけん..."
  loop do
    puts "1 グー　| 2 チョキ | 3 パー | 4 終了する"
    @user_value =  Readline.readline("> ", true).to_i
    @sys_value = rand(1..3)

    case @user_value
    when 1
      junken_result()
      next if junken_win(2,3,1) == "draw"
      break
    when 2
      junken_result()
      next if junken_win(3,1,2) == "draw"
      break
    when 3
      junken_result()
      next if junken_win(1,2,3) == "draw"
      break
    when 4
      puts "あっち向いてホイを終了します"
      return :exit
      break
    else 
      puts "1,2,3,4 の整数を記入してください"
    end
  end
end

def junken_win(wi, fa, dr)
  case @sys_value
  when wi
    @junken_iswin = true
  when fa
    @junken_iswin = false
  when dr
    puts "あいこで.."
    return "draw"
  end
end

def junken_result
  puts "--------------"
  puts "ポン　あなた:#{@jan_value[@user_value -1]} | 相手:#{@jan_value[@sys_value -1]}"
  puts "--------------"
end

# あっち向いてホイ
@attimuite_value = ["上", "下", "左", "右"]

def attimuite
  puts "あっち向いて..."
  loop do
    puts "1 上 | 2 下 | 3 左 | 4 右"
    @user_value =  Readline.readline("> ", true).to_i
    @sys_value = rand(1..4)

    case @user_value
    when 1
      attimuite_result()
      attimuite_win(1)
      break
    when 2
      attimuite_result()
      attimuite_win(2)
      break
    when 3
      attimuite_result()
      attimuite_win(3)
      break
    when 4
      attimuite_result()
      attimuite_win(4)
      break
    else 
      puts "1,2,3,4 の整数を記入してください"
    end
  end
end

def attimuite_win(wi)
  case @sys_value
  when wi
    if @junken_iswin == true
      puts "あなたの勝ちです!"
    else
      puts "あなたの負けです"
    end
    @attimuite_iswin = true
  end
end

def attimuite_result
  puts "--------------"
  puts "ホイ！　あなた:#{@attimuite_value[@user_value -1]} | 相手:#{@attimuite_value[@sys_value -1]}"
  puts "--------------"
end

# 実行コード

loop do
  break if junken() == :exit
  attimuite()
  break if @attimuite_iswin == true
end
  