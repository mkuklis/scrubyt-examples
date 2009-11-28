require 'rubygems'
require 'scrubyt'
require 'uri'

module ScrubDict
  class Factory
    @dicts = {:dict => "Dict", :ling => "Ling"}

    def self.scrub(dict, word)

      dict = dict.to_sym

      if !@dicts[dict].nil?
        dict_class = Object.const_get(:ScrubDict).const_get(@dicts[dict])
        words = dict_class.scrub(word)
      else
        words = nil
      end
    end
  end
end

