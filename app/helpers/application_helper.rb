module ApplicationHelper
	
	def toVND(price)
		#return number_to_currency(price, locale: :vi)  
		return number_to_currency(price, unit: "VND", separator: ",", delimiter: ".", format: "%n %u", precision: 0)
		#return number_to_currency(price)  
	end

	def toVNTimezone(dt)
		return dt.strftime('%d/%m/%Y %k:%M')
	end

	
end
