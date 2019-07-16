App.chat = null

current_user_id = ->
  $('input:hidden[name="from_id"]').val()
  console.log($('input:hidden[name="from_id"]').val())

inquiry_room_id = ->
  $('#inquiry_room_user_id').val()
  console.log("roomid;" + $('#inquiry_room_user_id').val())

room_ch = ->
  id = inquiry_room_id()
  console.log "room_ch function:" + id
  if id?
    return {channel: 'InquiryChatChannel', inquiry_room_id: id}
  else
    return null

messages_height = ->
  temp = 0;
  $("div.message").each ->
    temp += ($(this).height());
  return temp

$ ->
  App.inquiry_chat = App.cable.subscriptions.create "InquiryChatChannel",
    connected: -> console.log("connected")
    received: (data) ->
      if data.inquiry_message.from_id == $('input:hidden[name="from_id"]').val()
        currentUserMsg = '<div class="message" data-session=""><div class="message_right" style="margin: 20px 0 20px 0;width: 100%;"><span class="" id="message_content" style="background-color: #ffe4e1;font-size: 30px;">' + data.inquiry_message.content.replace(/¥"/g,"") + '</span></div></div>'
        $('#inquiry_messages').append currentUserMsg
      else
         otherUserMsg = '<div class="message" data-session=""><div class="message_left" style="margin: 20px 0 20px 0;width: 100%;"><span class="" id="message_content" style="background-color: #efefef;font-size: 30px;">' + data.inquiry_message.content.replace(/¥"/g,"") + '</span></div></div>'
        $('#inquiry_messages').append otherUserMsg
      $('section.message_box').scrollTop(messages_height());

    speak: (from_id, inquiry_room_id, content) ->
      @perform 'speak', {
       "from_id": $('input:hidden[name="from_id"]').val()
       "inquiry_room_id": $('input:hidden[name="inquiry_room_id"]').val()
       "adminflag": $('#adminflag').val()
       "content": content
      }
  $('#send_inquiry').on 'click', ->
    value = $('.input-text').val()
    if value.replace(/\s/g, '').length > 0 && value.length <= 500
      App.inquiry_chat.speak(current_user_id(), inquiry_room_id(), value)
      event.target.value = ''
      event.preventDefault()
    else if value.length > 500
      alert("Message should be less than 501 characters.")
      event.target.value = ''
      event.preventDefault()
    else
      event.target.value = ''
      event.preventDefault()