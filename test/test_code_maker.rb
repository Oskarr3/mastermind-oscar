require 'minitest/autorun'
require 'minitest/reporters'
require "mastermind/oscar/codemaker"
require "mastermind/oscar/printer"
require "mastermind/oscar/record_manager"
require "mastermind/oscar/time_manager"
require "stringio"

class CodemakerTest < Minitest::Test
  def setup
    difficulty  = :intermediate
    printer     = Mastermind::Oscar::Printer.new
    recorder    = Mastermind::Oscar::RecordManager.new(difficulty,StringIO.new("Jeff\n"))
    @client     = Mastermind::Oscar::Codemaker.new(difficulty,printer,recorder)
  end

  def test_generate_code
    @client.generate_code
    assert_equal(6, @client.code.length)
    assert !@client.code.include?("m")

    timer_test

    init_message_test
  end

  def timer_test
    @client.init
    assert_instance_of(Mastermind::Oscar::TimeManager, @client.timer)
  end

  def init_message_test
    @client.init_message
  end
end