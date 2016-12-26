class Call < ActiveRecord::Base
  belongs_to :job

  def self.call_request
    response = HTTParty.get(
      "https://api.callrail.com/v1/calls.json",
      headers: {"Authorization" => "Token token=#{ENV['CALLRAIL']}" }
    )
    return response.parsed_response
  end

  def self.parse_calls
    # Import all calls
    calls = self.call_request['calls']
    # Iterate through call list returned
    calls.each do |call|
      # Check to see if record exists before creating
      existing = Call.find_by(callrail_id: call['id'])
      unless existing
        Call.create(callrail_id: call['id'], recording: call['recording_player'], duration: call['duration'], start_time: call['start_time'], customer_phone_number: call['caller_number'])
      end
    end
  end
end
