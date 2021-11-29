module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def subscribed
      chatroom = Chatroom.find(params[:id])
      stream_for chatroom
    end
  end
end
