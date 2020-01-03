require 'net/http'
require 'json'

TREE_ID_ON = '6QMBS_5'
TREE_ID_OFF = '6QMBS_6'

class Power
  def toggle_power(id1, id2)
    uri           = URI.parse('https://power.mommycaniwatch.com/v1/toggle')
    https         = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req           = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' => 'application/json'})
    req.body      = { id1: id1, id2: id2 }.to_json.to_s
    https.request(req)
  end

  def trigger(hw_id)
    uri           = URI.parse('https://power.mommycaniwatch.com/v1/intermittent_on')
    https         = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    req           = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' => 'application/json'})
    req.body      = {{id: hw_id}.to_json.to_s => 'power_on'}.to_json.to_s
    https.request(req)
  end
end
