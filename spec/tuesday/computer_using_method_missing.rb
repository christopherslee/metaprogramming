# computer class using method missing instead
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  def method_missing(name, *args)
    super unless @data_source.respond_to? "get_#{name}_info"
    info = @data_source.send "get_#{name}_info", args.first
    price = @data_source.send "get_#{name}_price", args.first
    result = "#{name.to_s.capitalize}: #{info} ($#{price})"
    return "* #{name.to_s.capitalize}: #{info} ($#{price})" if price >= 100
    result
  end

  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end


