App.chat = null

current_user_id = ->
  $('input:hidden[name="from_id"]').val()
  console.log($('input:hidden[name="from_id"]').val())

room_id = ->
  $('input:hidden[name="room_id"]').val()
  console.log($('input:hidden[name="room_id"]').val())

room_ch = ->
  id = room_id()
  if id?
    return {channel: 'ChatChannel', room_id: id}
  else
    return null

messages_height = ->
  temp = 0;
  $("div.message").each ->
    temp += ($(this).height());
  return temp

$ ->
  App.chat = App.cable.subscriptions.create "ChatChannel",
    connected: -> console.log("connected")
    received: (data) ->
      if data.message.from_id == $('input:hidden[name="from_id"]').val()
        currentUserMsg = '<div class="message" data-session=""><div class="message_right" style="margin: 20px 0 20px 0;width: 100%;"><span class="" id="message_content" style="background-color: #ffe4e1;font-size: 30px; padding: 8px;border-radius: 5%;">' + data.message.content.replace(/¥"/g,"") + '</span></div></div>'
        $('#messages').append currentUserMsg
      else
         otherUserMsg = '<div class="message" data-session=""><div class="message_left" style="margin: 20px 0 20px 0;width: 100%;"><span class="" id="message_content" style="background-color: #efefef;font-size: 30px; padding: 8px;border-radius: 5%;">' + data.message.content.replace(/¥"/g,"") + '</span></div></div>'
        $('#messages').append otherUserMsg
      $('section.message_box').scrollTop(messages_height());

    speak: (from_id, room_id, content) ->
      @perform 'speak', {
       "from_id": $('input:hidden[name="from_id"]').val()
       "room_id": $('input:hidden[name="room_id"]').val()
       "content": content
      }
  $('#send').on 'click', ->
    value = $('.input-text').val()
    if value.replace(/\s/g, '').length > 0 && value.length <= 500
      App.chat.speak(current_user_id(), room_id(), value)
      event.target.value = ''
      event.preventDefault()
    else if value.length > 500
      alert("Message should be less than 501 characters.")
      event.target.value = ''
      event.preventDefault()
    else
      event.target.value = ''
      event.preventDefault()