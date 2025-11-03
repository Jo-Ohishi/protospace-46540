class Message < ApplicationRecord
  def index
   @messages = Message.all
  end
end
