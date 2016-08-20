# $(".card").html("<%= j render partial: 'card_img', locals: { food_item: @curr_food_item } %>")
$(document).on "turbolinks:load", ->
	$("#tourcomment_content").keyup (event) ->
		if(event.keyCode == 13)
		#Tourcomment.create(event.target.value)
			$('#new_tourcomment').submit();
		event.preventDefault();