class GetData
  def load_data(path, data_name)
    return unless File.exist?(path)

    puts "Loading #{data_name} data from #{path}..."
    loaded_data = JSON.parse(File.read(path))
    puts "#{data_name.capitalize} data loaded successfully!"
    loaded_data
  end
end
