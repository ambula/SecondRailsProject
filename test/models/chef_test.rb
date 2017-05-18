require 'test_helper'

class CheftTest < ActiveSupport::TestCase
    def setup
        @chef = Chef.new(chefname: "john",email: "john@example.com")
    end
    
    test "Chef should be valid" do
        assert @chef
    end
    
    test "Chef name should present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end
    
    test "Chef name must not be short" do
        @chef.chefname = "aaa"
        assert_not @chef.valid?
    end
    
    test "Chef name must not be long" do
        @chef.chefname = "a" * 41
        assert_not @chef.valid?
    end
    
    test "email should be present" do
        @chef.email = " "
        assert_not @chef.valid?
    end
    
    test "email length should be within bounds" do
        @chef.email = "a"*101 + "@example.com"
        assert_not @chef.valid?
    end
    
    test "email should be unique" do
        dup_chef = @chef
        dup_chef.email = @chef.email.upcase;
        @chef.save
        assert_not dup_chef.valid?
    end
    
    test "email should be valid" do
        valid_address = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.eu laura+joe@monk.cm]
        valid_address.each do |val|
            @chef.email = val
            assert @chef.valid?, '#{val.inspect should be valid}'
        end
    end
end