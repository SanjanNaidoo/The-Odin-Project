def substring(dictionary, text)
    output = {}

    dictionary.each do |s|
        count = text.downcase.scan(s).count
        output[s] = count unless count == 0
    end
    
    return output
end
        
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit", "low"]

puts substring(dictionary, "Howdy partner, sit down! How's it going?")