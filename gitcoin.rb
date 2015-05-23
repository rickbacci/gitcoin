require 'digest'
require 'net/http'
require 'uri'
  
loop do
  uri = URI.parse("http://git-coin.turingapps.io/hash")
  sha = target = Net::HTTP.get(URI.parse("http://git-coin.turingapps.io/target"))

  until sha.hex < target.hex
    rand_string = ('a'..'z').to_a.sample(rand(26)).join
    sha = Digest::SHA1.hexdigest(rand_string)
  end
    p Net::HTTP.post_form(uri, { 'message' => rand_string, 'owner' => 'RickBacci' })
end

