module ConstantContact
	class CampaignSchedule < Base
		DATE_FORMAT = "%Y-%m-%dT%H:%M:%SZ"

		attr_accessor :campaign_id
		self.prefix = "/campaigns/:campaign_id/"
		self.collection_name = 'schedules'

		def initialize(*args)
			obj = super
			obj
		end

		def to_xml
			xml = Builder::XmlMarkup.new
			xml.tag!('Schedule', :xmlns => XML_NAMESPACE, :id => schedule_url) do
				self.attributes.reject {|k,v| k.to_s.camelize == 'CampaignId'}.each{|k, v| xml.tag!( k.to_s.camelize, v )}
			end
		end

		def campaign_url
			API_BASE_URI
		end

		def campaign_path
			'/ws/customers/' + self.class.user + '/campaigns/' + self.prefix_options[:campaign_id].to_s
		end

		def schedule_path
			'/schedules/1'
		end

		def self.element_path(id, prefix_options = {}, query_options = nil)
			prefix_options, query_options = split_options(prefix_options) if query_options.nil?
			"/ws/customers/#{self.user}#{prefix(prefix_options)}#{collection_name}#{query_string(query_options)}/#{id.split('/').last}"
		end

		def schedule_url
			campaign_url + campaign_path + schedule_path
		end

		# Overridden from CTCT::Base
		def encode
			tn = Time.now.strftime(DATE_FORMAT)
			"<entry xmlns=\"http://www.w3.org/2005/Atom\">
				<link href=\"#{self.campaign_path}#{self.schedule_path}\" rel=\"edit\"/>
				<id>#{self.schedule_url}</id>
				<title type=\"text\">#{tn}</title>
				<updated>#{tn}</updated>
				<author><name>WHERE, Inc</name></author>
				<content type=\"application/vnd.ctct+xml\">
				#{self.to_xml}
				</content>
			</entry>"
		end
	end
end