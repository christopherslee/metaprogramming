# uncomment the one you want to test
#require './spec/tuesday/computer'
#require './spec/tuesday/computer_using_send'
#require './spec/tuesday/computer_using_define_method'
require './spec/tuesday/computer_using_introspection'

describe Computer do

  it "should return the price for a mouse" do
    data_source = double(:get_mouse_info => "standard mouse",
                         :get_mouse_price => 99
                        )
    computer = Computer.new('id_123', data_source)
    computer.mouse.should == "Mouse: standard mouse ($99)"
  end

  it "should return a warning if the mouse price is gte 100" do
    data_source = double(:get_mouse_info => "standard mouse",
                         :get_mouse_price => 100
                        )
    computer = Computer.new('id_123', data_source)
    computer.mouse.should == "* Mouse: standard mouse ($100)"
  end

  it "should return the price for a cpu" do
    data_source = double(:get_cpu_info => "intel cpu",
                         :get_cpu_price => 99
                        )
    computer = Computer.new('id_123', data_source)
    computer.cpu.should == "Cpu: intel cpu ($99)"
  end

  it "should return a warning if the cpu price is gte 100" do
    data_source = double(:get_cpu_info => "intel cpu",
                         :get_cpu_price => 100
                        )
    computer = Computer.new('id_123', data_source)
    computer.cpu.should == "* Cpu: intel cpu ($100)"
  end

end
