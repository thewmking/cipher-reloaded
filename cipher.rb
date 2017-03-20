require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  message = "fine"
  if message.to_s.empty? == true
    message = "fine"
    shift = 2
  else
    message = params['message'].to_s
    shift_factor = params['shift_factor']
    shift = shift_factor.to_i
  end
  cipher = "#{caesar_cipher(message, shift).join}"
  erb :index, :locals => {:message => message, :shift_factor => shift_factor, :cipher => cipher}
end


puts "what is your message?"
#message

puts "what is your shift factor?"
#shift_factor
#shift = shift_factor.to_i

def caesar_cipher(message, shift)
  alphabet = Array('a'..'z')
  non_caps = Hash[alphabet.zip(alphabet.rotate(shift))]

  alphabet = Array('A'..'Z')
  caps     = Hash[alphabet.zip(alphabet.rotate(shift))]

  encrypter = non_caps.merge(caps)

  message.chars.map { |c| encrypter.fetch(c, c)}
end

#puts caesar_cipher(message, shift).join
