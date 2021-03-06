module ConstantContact
	class List < Base
		def to_xml
			xml = Builder::XmlMarkup.new
			xml.tag!("ContactList", :xmlns => XML_NAMESPACE) do
				self.attributes.each{|k, v| xml.tag!( k.to_s.camelize, v )}
			end
		end

		def self.find_by_name(name)
			lists = self.find :all
			lists.find{|list| list.Name == name}
		end
	end
end