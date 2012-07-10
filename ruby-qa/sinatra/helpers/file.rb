module file

get '/Users/kwaun-jonglin/Desktop/:file' do |file|
file = File.join('/Users/kwaun-jonglin/Desktop/test.zip', file)
send_file(file, :disposition => 'attachment', :filename => File.basename(file))
end