#!/usr/bin/ruby
def getData
  @theResult = Result.create(:message => "This is a message, yes!")
  @newTest = PersonalTest.create(:name => "New Test", :description => "This is the latest test")
  @theUser = User.create(:name => "I Approved", :email => "me@allsekki.til", :password => "password")
  @theSession = UserPersonalTestSession.create(:user_id => @theUser.id, :personal_test_id => @newTest.id, :result_id => @theResult.id)
end

def createQuestions
  @questionOne = Question.create(:question_text => "first", :value => 1, :personal_test_id => @newTest.id )
  @questionTwo = Question.create(:question_text => "second", :value => 2, :personal_test_id => @newTest.id)
  @questionThree = Question.create(:question_text => "third", :value => 3, :personal_test_id => @newTest.id)
  @questionFour = Question.create(:question_text => "fourth", :value => 4, :personal_test_id => @newTest.id)
  @questionFive = Question.create(:question_text => "five", :value => 5, :personal_test_id => @newTest.id)
  @questionSix = Question.create(:question_text => "sixth", :value => 6, :personal_test_id => @newTest.id)
end

def answerQuestions
  @theSession.personal_test.questions.each do |q|
    if q.id % 2 == 0 
      q.answer = 1
    end
  end  
end

def calculateResult
  @theSession.result.score = 0
  @theSession.personal_test.questions.each do |q|
      if q.answer != 0
        @theSession.result.score += q.value
      end
  end
  @theSession.result.save!
end

getData
createQuestions
answerQuestions
calculateResult

puts "The result is:" 
#puts @newTest.result.inspect
puts @theSession.result.score.inspect
