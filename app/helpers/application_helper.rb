module ApplicationHelper
	
	def toVND(price)
		#return number_to_currency(price, locale: :vi)  
		return number_to_currency(price, unit: "VND", separator: ",", delimiter: ".", format: "%n %u", precision: 0)
		#return number_to_currency(price)  
	end

	def toVNTimezone(dt)
		return dt.strftime('%d/%m/%Y %k:%M')
	end

	def span_tag(status)

		tagg = case status
		when 'pending' 
			'tag tag-default'
		when 'approved' 
			'tag tag-success'
		when 'rejected' 
			'tag tag-warning'
		when 'cancelled' 
			'tag tag-danger'
		end

		return content_tag(:span, status, class: tagg  )
	end

	def markdown(text)
		options = {
			filter_html:     true,
			hard_wrap:       true, 
			link_attributes: { rel: 'nofollow', target: "_blank" },
			space_after_headers: true, 
			fenced_code_blocks: true
		}

		extensions = {
			autolink:           true,
			superscript:        true,
			disable_indented_code_blocks: true
		}

		renderer = Redcarpet::Render::HTML.new(options)
		markdown = Redcarpet::Markdown.new(renderer, extensions)

		markdown.render(text).html_safe
	end
end
