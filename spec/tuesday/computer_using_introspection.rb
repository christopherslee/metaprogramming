# computer class using define method instead and introspection to define
# the components
class Computer
  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
    @data_source.methods.grep(/^get_(.*)_info$/) { Computer.define_component $1 }
  end

  def self.define_component(name)
    define_method(name) do
      info = @data_source.send "get_#{name}_info", @id
      price = @data_source.send "get_#{name}_price", @id
      result = "#{name.to_s.capitalize}: #{info} ($#{price})"
      return "* #{name.to_s.capitalize}: #{info} ($#{price})" if price >= 100
      result
    end
  end

  def respond_to?(method)
    @data_source.respond_to?("get_#{method}_info") || super
  end
end
