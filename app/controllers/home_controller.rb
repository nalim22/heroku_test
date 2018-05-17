require 'mailgun'

class HomeController < ApplicationController
  def index
  end
  
  def write
    @almond = params[:title]
    @cherry = params[:email]
    @anchovy = params[:content]
    
    mg_client = Mailgun::Client.new("key-a12c3a5b379574e01ea929e5753191e5")

    message_params =  {
                       from: 'bob@example.com',
                       to:   @cherry,
                       subject: @almond,
                       text:    @anchovy
                      }

    result = mg_client.send_message('sandbox731805e2181f41ac8af1be5d162bac39.mailgun.org', message_params).to_h!
    
    message_id = result['id']
    message = result['message']
  end
end
