class Call < ActiveRecord::Base
  belongs_to :job
  belongs_to :vendor
  has_many :notes, as: :noteable, dependent: :destroy

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
      if existing
        existing.recording = call['recording_player']
        existing.save
      end

      # unless existing
      #   Call.create(callrail_id: call['id'], recording: call['recording_player'], duration: call['duration'], start_time: call['start_time'], customer_phone_number: call['caller_number'])
      # end
    end
  end

  def self.precall_parse(json_body)
    Call.create(callrail_id: json_body[:id], datetime: json_body[:datetime], trackingnum: json_body[:trackingnum],customer_phone_number: json_body[:customer_phone_number], customer_name: json_body[:customer_name], destinationnum: json_body[:destinationnum], customer_city: json_body[:customer_city], customer_state: json_body[:customer_state], customer_zip: json_body[:customer_zip], customer_country: json_body[:customer_country], keywords: json_body[:keywords], referrer: json_body[:referrer], landingpage: json_body[:landingpage], referrermedium: json_body[:referrermedium], last_requested_url: json_body[:last_requested_url], gclid: json_body[:gclid], ip: json_body[:ip], utm_source: json_body[:utm_source], utm_medium: json_body[:utm_medium], utm_term: json_body[:utm_term], utm_content: json_body[:utm_content], utm_campaign: json_body[:utm_campaign], utma: json_body[:utma], utmb: json_body[:utmb], utmv: json_body[:utmv], utmz: json_body[:utmz], ga: json_body[:ga], first_call: json_body[:first_call], inprogress: true)
  end

  def self.postcall_parse(json_body)
    p json_body
    p call = Call.find_by(callrail_id: json_body[:id])

    p call.update(duration: json_body[:duration], recording: json_body[:recording_player], answered: json_body[:answered], transcription: json_body[:transcription],inprogress: false)
    call.save
  end
end

# HTTParty.get("	https://rest.tsheets.com/api/v1/jobcodes", headers:{"Authorization" => "Bearer #{ENV['TSHEETS_TOKEN']}"})
