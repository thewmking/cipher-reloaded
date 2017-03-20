require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "Hello world!"
end


puts "what is your message?"
message = gets.chomp

puts "what is your shift factor?"
shift_factor = gets.chomp
shift = shift_factor.to_i

def caesar_cipher(message, shift)
  alphabet = Array('a'..'z')
  non_caps = Hash[alphabet.zip(alphabet.rotate(shift))]

  alphabet = Array('A'..'Z')
  caps     = Hash[alphabet.zip(alphabet.rotate(shift))]

  encrypter = non_caps.merge(caps)

  message.chars.map { |c| encrypter.fetch(c, c)}
end

puts caesar_cipher(message, shift).join
