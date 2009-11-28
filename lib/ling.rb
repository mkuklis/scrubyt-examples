module ScrubDict
  class Ling
    def self.scrub(word)
      begin
        result = Scrubyt::Extractor.define do
          fetch URI.escape("http://www2.ling.pl/lingfeed-ps.php?word=#{word}&sType=0&chooseLang=1")
          dicts "//div" do
            eng "//div[@class='dictdef']"
            pl "//div[@class='dictword']"
          end.ensure_presence_of_pattern('pl').ensure_presence_of_pattern('eng')
        end
        result.to_flat_hash
      rescue
        result = nil
      end
    end
  end
end

