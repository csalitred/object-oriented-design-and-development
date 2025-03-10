# Part 1
def two_sum?(a, n)
  seen = {}
  # iterate through each num in a
  a.each do |num|
    complement = n - num
    # check if copmlement is already in the 'seen' hash
    if seen.key?(complement) 
      return true
    end
    
    # if complement not found in hash, add to hash
    seen[num] = true
  end
  
  # if no pair is found 
  false
end

def max_sub_array(a)
  # Handle empty array case
  return false if a.empty?
  
  max_current = a[0]
  max_global = a[0]

  # iterate through each num in a
  a[1..-1].each do |num|
    max_current = [num, max_current + num].max 
    max_global = [max_global, max_current].max
  end

  # return maxmimum value
  max_global
end

def group_anagrams(a)
  # hash with default value for key is an empty array
  anagrams = Hash.new { |hash, key| hash[key] = [] }

  # iterate through each word in a
  a.each do |word|
    # sorts letters alphabetically
    sorted_word = word.chars.sort.join
    anagrams[sorted_word] << word 
  end

  # values are arrays of grouped anagrams
  anagrams.values
end

# Part 2
def brackets_match?(s)
  stack = []

  # Iterate through each char in s
  s.each_char do |char|
    if char == "(" || char == "{" || char == "["
      stack.push(char)
    elsif (char == ")" && stack.last == "(") ||
          (char == "]" && stack.last == "[") ||
          (char == "}" && stack.last == "{")
      stack.pop
    else
      return false
    end
  end

  # if empty stack, all brackets are matched
  return stack.empty?
end

def remove_and_append_vowels(s)
  appended_vowels = s.scan(/[aeiou]/i).join
  removed_vowels = s.gsub(/[aeiou]/i, "")
  return removed_vowels + appended_vowels
end

def highest_frequency_word(s)
  words = s.downcase.gsub(/[^a-z\s]/, "").split

  # count frequency for each word using hash
  word_counts = Hash.new(0)
  words.each do |word|
    word_counts[word] += 1
  end

  # Get the highest frequency
  return word_counts.max_by { |word, count| count }.first
end

# Part 3
class Book
  # Constructor: the book with title and price
  def initialize(title, price)
    # raise ArgumentError
    raise ArgumentError, "Title can't be empty" if title.nil? || title.strip.empty?
    raise ArgumentError, "Price can't be empty and must be greater than zero" if price.nil? || price <= 0

    # private attributes
    @title = title
    @price = price
  end

  # Getters and Setters
  attr_accessor :title, :price

  # Method to format the price
  def formatted_price
    dollars = @price.to_i
    cents = ((@price - dollars) * 100).round

    if dollars > 0 && cents > 0
      return "#{dollars} dollars and #{cents} cents"
    elsif dollars > 0
      return "#{dollars} dollars"
    elsif cents > 0
      return "#{cents} cents"
    else
      return "0 cent"
    end
  end
end
