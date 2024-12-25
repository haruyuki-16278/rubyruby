require 'webrick'

# srcディレクトリへの絶対パスを取得
SRC_DIR = File.join(Dir.pwd, 'src')

server = WEBrick::HTTPServer.new(
  Port: 3000,
  DocumentRoot: SRC_DIR,
  BindAddress: '0.0.0.0'
)

puts "サーバーを起動しました！"
puts "ドキュメントルート: #{SRC_DIR}"
puts "http://localhost:3000 にアクセスしてね！"

# サーバーの終了処理
trap('INT') { server.shutdown }

server.start 
