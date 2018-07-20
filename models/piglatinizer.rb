class PigLatinizer

  def piglatinize(phrase)
    arr = phrase.split(" ")
    arr.collect do |word|
      piglatinize_word(word)
    end
    arr.join(" ")
  end

  def piglatinize_word(word)
    if word[0].downcase.match(/[aeoiu]/) #begins w a vowel
      word << "way"
    elsif word[0..2].downcase.match(/[bcdfghjklmnpqrstvwxyz]{3}/)
      word << word[0..2]

      word.slice!(0..2)
      word << "ay"
    elsif word[0..1].downcase.match(/[bcdfghjklmnpqrstvwxyz]{2}/)
      word << word[0..1]

      word.slice!(0..1)
      word << "ay"
    elsif word[0].downcase.match(/[bcdfghjklmnpqrstvwxyz]/)
      #word = word.slice(3..-1) # + word.slice(0,3)
      word << word[0]
      word.slice!(0)
      word << "ay"
      # word << "pay"
    else
      word[0] += "noway"
    end
  end

end
