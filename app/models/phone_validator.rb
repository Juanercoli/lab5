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
                .abstractapi_api_key,
              number: @number
            }
          })
       
          response["is_valid_number"] && (response["country_prefix"] == "+54")
    end
end