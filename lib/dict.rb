module ScrubDict
  class Dict
    def self.scrub(word)
      begin    
        result = Scrubyt::Extractor.define do
          fetch URI.escape("http://www.dict.pl/dict?word=#{word}&lang=EN")
          name "//td[@class='resWordCol']", :write_text => true do
            link_url
          end
        end
        result.to_flat_hash
      rescue
        result = nil
      end
    end
  end
end
