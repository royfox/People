# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


# @changeState = (self) ->
# 	container = $("#state_container")
# 	$.ajax '/people/'+$(self).attr('person_id')+'/state',
# 		{data: {state_id: $(self).find('option:selected').val()},
# 		type: 'POST'}
# 	    dataType: 'html'
# 	    error: (jqXHR, textStatus, errorThrown) ->
# 	        console.log("error..")
# 	    success: (data, textStatus, jqXHR) ->
# 	        console.log("hej")
# 	
	
	
	# switch $(self).find('option:selected').html()
	# 		when "New" then container.html("")
	# 		when "Rejected" then console.log("rejected")
	# 		when "Test 1" 
	# 			container.find("#title").html('Send "Test 1" mail')
	# 			container.find("#body").html('<p><div contenteditable="true" id="mailcontent"></div></p><button onclick="preview()">Preview</button><button onclick="sendMail()">Send test 1 mail</button>')
	# 		when "SSLU Test" then console.log(SSLU Test)
	# 
	

@preview = () ->
	preview = $('<div id="preview" contentEditable="true"></div>')
	preview.html($("#mailcontent").html())
	preview.click ->
		$(this).remove()
	$("body").append(preview);


@sendMail = () ->

	

