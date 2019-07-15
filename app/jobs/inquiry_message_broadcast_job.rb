class InquiryMessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(inquiry_message)
     ActionCable.server.broadcast "inquiry_chat_channel_#{inquiry_message.inquiry_room_id}",
                               inquiry_message: render_inquiry_message(inquiry_message)
  end

  private

  def render_message(inquiry_message)
    ApplicationController.renderer.render(partial: 'inquiry_messages/inquiry_message',
                                          locals: {inquiry_message: inquiry_message})
  end

end