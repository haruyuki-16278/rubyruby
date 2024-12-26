require 'js'

class App
  def self.init
    # グローバルのdocumentオブジェクトを取得
    @document = JS.global[:document]
    @localStorage = JS.global[:localStorage]
    @main = @document.querySelector('#main')

    # ページをセットアップ
    setup_index_page

    puts "Ruby.wasm App initialized! (Ruby #{RUBY_VERSION})"
  end

  private

  def self.setup_index_page
    @main[:innerHTML] = ''

    title = @document.createElement('h1')
    titleRubyTarget = @document.createElement('ruby')
    titleRubyTarget[:textContent] = 'Ruby'
    titleRubyText = @document.createElement('rt')
    titleRubyText[:textContent] = 'ルビ'
    titleRubyTarget.appendChild(titleRubyText)
    title.appendChild(titleRubyTarget)
    @main.appendChild(title)

    label = @document.createElement('label')
    label[:textContent] = 'ユーザー名'
    input = @document.createElement('input')
    input[:type] = 'text'
    input[:placeholder] = '名前を入力してね'
    input[:id] = 'indexUserName'
    input[:value] = @localStorage.getItem('userName')
    label.appendChild(input)
    @main.appendChild(label)

    startButton = @document.createElement('button')
    startButton[:textContent] = 'スタート'
    startButton[:id] = 'indexStart'
    startButton.addEventListener('click') do |event|
      userName = input[:value]
      @localStorage.setItem('userName', userName)
    end
    @main.appendChild(startButton)
  end
end

# アプリケーションの初期化
App.init
