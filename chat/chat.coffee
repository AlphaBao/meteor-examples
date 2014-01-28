Messages = new Meteor.Collection("messages")

if Meteor.isClient
  Template.messages.messages = ->
    Messages.find {}, sort: { time: -1 }

  Template.entryfield.events =
    "keydown #message": (e) ->
      if e.which is 13
        $name = $("#name")
        $message = $("#message")

        unless $name.val() is "" or $message.val() is ""
          Messages.insert
            name: $name.val()
            message: $message.val()
            time: Date.now()

          $name.val("")
          $message.val("")

  console.log "bao..."