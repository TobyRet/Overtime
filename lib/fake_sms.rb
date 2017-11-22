module FakeSMS
  Message = Struct.new(:number, :message)
  @messages = []

  def self.send_msg(number, message)
    @messages << Messages.new(number, message)
  end

  def self.messages
    @messages
  end
end
