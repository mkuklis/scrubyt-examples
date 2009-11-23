require 'rubygems'
require 'scrubyt'

# scrub data from dict
dict_data = Scrubyt::Extractor.define do
  fetch 'http://www.dict.pl/dict?word=test&words=&lang=EN'
  name "//td[@class='resWordCol']", :write_text => true do
    link_url
  end
end

p dict_data.to_hash
