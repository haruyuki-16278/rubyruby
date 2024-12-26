require 'webrick'

server = WEBrick::HTTPServer.new(
  Port: 3000,
  DocumentRoot: File.join(Dir.pwd, 'src'),
  BindAddress: '0.0.0.0'
)

puts "🚀 開発サーバーを起動します..."
puts "📁 ドキュメントルート: #{File.join(Dir.pwd, 'src')}"
puts "🌐 http://localhost:3000 にアクセスしてね！"
puts "終了するには Ctrl+C を押してください"

trap('INT') { server.shutdown }

server.start
