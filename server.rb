#require sinatra framework to handle http requests
#require json so the app can handle json objects
require 'sinatra' 
require 'json'

#before action filter to transform json into instance of class Input
before do
  request_payload = (JSON.parse request.body.read)["text"]
  @input = Input.new(request_payload)
end

#after action to generate and spit out answer json
after do
  p JSON.generate({"text"=>@input.text,"answer"=>@answer})
end

#create class Input to handle all the various text methods.
class Input
  attr_reader :text

  def initialize(text)
    #remove trailing white space and line breaks
    @text = text.strip.gsub("\"", "'")
  end

  #function for average word length
  def avg_len
    #downcase, split into array by none word characters except an apostrophe followed by a word character
    #calculate word length
    words = self.text.downcase.strip.split(/[^'\w]+/)
    words.join.length.fdiv(words.length)
  end

  #function for most common word
  def most_com
    #split text into word array (same as above)
    #create word hash, sort alphabetically, select word /w highest frequency
    words = self.text.downcase.strip.split(/[^'\w]+/)
    words.group_by(&:itself).values.sort.max_by(&:size).last
  end

  #function for median word
  def median
    #split text
    #compile words into key value pair for word => frequency
    #change hash to array -sort, push & pop until middle value
    #find all key values matching middle value frequency
    #join array into string
    words = self.text.downcase.strip.split(/[^'\w]+/)
    freq = words.reduce(Hash.new{|i|0}){|res,w| res[w.downcase]+=1;res}
    arr = freq.dup.sort_by {|key, value| value}
    while arr.length > 2 do
      arr.pop
      arr.shift
    end
    if arr.length == 2
      arr.pop
      num = arr[0][1]
    else
      num = arr[0][1]
    end
    freq.delete_if{|k,v|v != num}.keys.join(", ")
  end

  #average sentence length function
  def avg_len_s
    #split sentences into array by puctuation
    #calculate average
    sentences = self.text.scan(/[^\.!?]+[\.!?]/).map(&:strip)
    sentences.join.length.fdiv(sentences.length)
  end

  def phones
    #scan text for numbers & normalize digits and push into array
    #iterate and check numbers are equal to 10 digits
    #join as string of numbers
    numbers = self.text.scan(/([^A-Z|^"]{6,})/i).collect{|x| x[0].strip.gsub(/\D/, "") }
    numbers.each_with_index do |num, index|
      if num.length != 10
        numbers.delete_at(index)
      end
    end
    numbers.join(", ")
  end
end

#set production environment and port
set :port, 8080 
set :environment, :production

#all the post routes
post '/words/avg_len' do
  @answer = @input.avg_len
end

post '/words/most_com' do
  @answer = @input.most_com
end

post '/words/median' do
  @answer = @input.median
end

post '/sentences/avg_len' do
  @answer = @input.avg_len_s
end

post '/phones' do
  @answer = @input.phones
end