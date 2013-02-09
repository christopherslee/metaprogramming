describe "OpenClasses" do

  it "should return the alpha numeric string" do
    class String
      def to_alphanumeric
        gsub(/[^\w\s]/, '')
      end
    end

    "#3, the *Magic, Number*?".to_alphanumeric.should == "3 the Magic Number"
  end

end
