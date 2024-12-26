require 'js'

class App
  def self.init
    # グローバルのdocumentオブジェクトを取得
    @document = JS.global[:document]
    @localStorage = JS.global[:localStorage]

    # 要素を取得
    setup_elements
    # イベントリスナーの設定
    setup_listeners

    puts "Ruby.wasm App initialized! (Ruby #{RUBY_VERSION})"
  end

  private

  def self.setup_elements
    @startButton = @document.querySelector('#indexStart')
    @userNameInput = @document.querySelector('#indexUserName')
    @userNameInput[:value] = @localStorage.getItem('userName')
  end

  def self.setup_listeners
    return unless @startButton && @userNameInput

    @startButton.addEventListener('click') do |event|
      userName = @userNameInput[:value]
      @localStorage.setItem('userName', userName)
    end
  end
end

# アプリケーションの初期化
App.init
