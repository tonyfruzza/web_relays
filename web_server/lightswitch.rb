require 'rack/contrib'
require 'thread'

use Rack::PostBodyContentTypeParser

def get_state
  `usbrelay`.each_line.map{|l| {id: l.split('=').first.strip, state: l.split('=').last.strip}}
end

get '/' do
 File.read('index.html')
end

get '/v1/status' do
 JSON.generate(get_state)
end

post '/v1/intermittent_on' do
  request.body.rewind
  puts params
  puts data = JSON.parse(params.first.first)
  return JSON.generate({error: 'no id set'}) unless data.key?('id')
  return JSON.generate({error: 'unknown id'}) unless get_state.map{|s| s[:id]}.include? data['id']
  cmd = "usbrelay #{data['id']}=1"
  puts "Executing: #{cmd}"
  `#{cmd}`
  sleep 0.5
  `usbrelay #{data['id']}=0`
  JSON.generate(get_state)
end

post '/v1/toggle' do
  request.body.rewind
  puts data = JSON.parse(request.body.read)
  return JSON.generate({error: 'no id set'}) unless data.key?('id1')
  return JSON.generate({error: 'unknown id'}) unless get_state.map{|s| s[:id]}.include? data['id1']
  return JSON.generate({error: 'no id set'}) unless data.key?('id2')
  return JSON.generate({error: 'unknown id'}) unless get_state.map{|s| s[:id]}.include? data['id2']
  Thread.new{do_the_toggle(data['id1'], data['id2'])}
  JSON.generate(get_state)
end

post '/v1/intermittent_on_cw_event' do
  request.body.rewind
  puts data = JSON.parse(JSON.parse(request.body.read)['Message'])
  return JSON.generate({error: 'no id set'}) unless data.key?('id')
  return JSON.generate({error: 'unknown id'}) unless get_state.map{|s| s[:id]}.include? data['id']
  `usbrelay #{data['id']}=1`
   sleep 0.25
  `usbrelay #{data['id']}=0`
  JSON.generate(get_state)
end

get '/v1/set' do
  return JSON.generate({error: 'no id set'}) unless params.key?('id')
  return JSON.generate({error: 'no state set'}) unless params.key?('state')
  return JSON.generate({error: 'unknown id'}) unless get_state.map{|s| s[:id]}.include? params['id']
  return JSON.generate({error: 'unknown state'}) unless ['0', '1'].include? params['state']
  `usbrelay #{params['id']}=#{params['state']}`
  JSON.generate(get_state)
end
set :bind, Proc.new {'0.0.0.0'}

def do_the_toggle(id1, id2)
  cmd = "usbrelay #{id1}=1"
  puts "Executing: #{cmd}"
  `#{cmd}`
  sleep 0.2
  `usbrelay #{id1}=0`

  cmd = "usbrelay #{id2}=1"
  puts "Executing: #{cmd}"
  `#{cmd}`
  sleep 0.2
  `usbrelay #{id2}=0` 
end

