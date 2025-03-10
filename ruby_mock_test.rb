load 'ruby_intro_program1_cs_jh_csalitr_jhuang42.rb'

def scores
  correct = 0
  wrong = 0
  full = 35

  # Q1
  begin
    two_sum?([-1,-2,4,4], 2) == true ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q2
  begin
    max_sub_array?([-2,1,-3,4,-1,2,1,-5,4]) == 6 ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q3
  begin
    group_anagrams(['elbow','cried','below','cider']) == [['elbow','below'],['cried','cider']] ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q4
  begin
    brackets_match?("([)]") == false ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q5
  begin
    remove_and_append_vowels("prayer") == 'pryrae' ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q6
  begin
    highest_frequency_word("She says she got married.") == 'she' ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # Q7
  begin
    b2 = Book.new("book", 8.89)
  rescue
    b2 = nil
  end

  begin
    b2.formatted_price == "8 dollars and 89 cents" ? correct+=1 : wrong+=1
  rescue
    wrong+=1
  end

  # puts correct+wrong
  puts correct, wrong, correct+wrong
  return ( (correct * full).to_f / (wrong + correct) ).round(2)
end

puts scores

