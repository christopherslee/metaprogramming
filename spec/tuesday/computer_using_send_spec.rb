require './spec/tuesday/computer_using_send'

describe "Computer using send" do

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

  it "should return true for respond_to?" do
    data_source = double(:get_mouse_info => "standard mouse",
                         :get_mouse_price => 99
                        )
    computer = Computer.new('id_123', data_source)
    computer.respond_to?(:mouse).should be_true
  end

end
