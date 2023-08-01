class GetData
  def load_data(path)
    return unless File.exist?(path)

    puts "Loading books data from #{path}"
    puts 'Books data loaded successfully!'
    JSON.parse(File.read(path))
  end
end
