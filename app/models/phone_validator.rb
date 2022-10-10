class PhoneValidator
    include HTTParty

    base_uri "https://phonevalidation.abstractapi.com/v1/"

    def initialize(number)
	    @number = number
	  end

    def valid?
        response = self.class.get("/", {
            query: {
              api_key: Rails.application
                .credentials
                .abstract_api_key,
              phone: @number
            }
          })
          
          pp response
          response["valid"] && (response["country"]["prefix"] == "+54")
    end
end