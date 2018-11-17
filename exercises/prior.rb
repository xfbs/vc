#!/usr/bin/env ruby

def sorted_distribution(text)
  absolute_distribution = text
    .scan(/[a-zA-Z]/)
    .inject({}){|m,c| m[c] = (m[c]||0)+1; m}
  total = absolute_distribution.values.sum
  relative_distribution = absolute_distribution
    .map{|k, v| [k, v.to_f / total]}
  sorted = relative_distribution
    .sort_by{|k, v| v}
end

# https://raw.githubusercontent.com/martinth/mobverdb/master/faust.txt
faust_distribution = sorted_distribution(File.read("faust.txt"))
puts "Faust: P(C_#{faust_distribution.last[0]}) = #{faust_distribution.last[1]}"

quote = "Der Satz von Bayes ist nach dem englischen Statistiker Thomas Bayes benannt."
quote_distribution = sorted_distribution(quote)
puts "Quote: P(C_s) = #{quote_distribution.to_h['s']}"

