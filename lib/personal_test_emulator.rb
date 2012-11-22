#!/usr/bin/ruby
  
def answerQuestions(session)
  session.personal_test.questions.each do |q|
    a = AnsweredQuestion.create(:question_id => q.id, :user_personal_test_session_id => session.id)
    if q.id % 2 == 0 
      a.answer = 1
      a.save!
    end
    session.save!
  end  
end

def calculateResult(session)
  session.result.score = 0
  session.personal_test.questions.each do |q|
    q.answered_questions.each do |a|
      if a.answer == 1
        session.result.score += q.value
      end
    end  
  end
  session.result.save!
end

def firstRun
  def getData
    @firstResult = Result.create(:message => "This is a message, yes!")
    @firstTest = PersonalTest.create(:name => "Ertu með athyglisbrest", :description => "Við skulum komast að því hvort þú sért með athyglisbrest.")
    @firstUser = User.create(:name => "Brian May", :email => "me@allsekki.til", :password => "password")
    @firstSession = UserPersonalTestSession.create(:user_id => @firstUser.id, :personal_test_id => @firstTest.id, :result_id => @firstResult.id)
  end

  def createQuestions
    @questionOne = Question.create(:question_text => "This is the very first question!", :value => 1, :personal_test_id => @firstTest.id )
    @questionTwo = Question.create(:question_text => "second", :value => 2, :personal_test_id => @firstTest.id)
    @questionThree = Question.create(:question_text => "third", :value => 3, :personal_test_id => @firstTest.id)
    @questionFour = Question.create(:question_text => "fourth", :value => 4, :personal_test_id => @firstTest.id)
    @questionFive = Question.create(:question_text => "five", :value => 5, :personal_test_id => @firstTest.id)
    @questionSix = Question.create(:question_text => "sixth", :value => 6, :personal_test_id => @firstTest.id)
  end
  
  getData
  createQuestions
  answerQuestions(@firstSession)
  calculateResult(@firstSession)

end

def secondRun
  def getData
    @secondResult = Result.create(:message => "This is a different message, yes!")
    @secondTest = PersonalTest.create(:name => "Ertu fífl?", :description => "Nú skulum við komast að því hvort þú sért fífl.")
    @secondUser = User.create(:name => "Freddie Mercury", :email => "him@allsekki.til", :password => "different_password")
    @secondSession = UserPersonalTestSession.create(:user_id => @secondUser.id, :personal_test_id => @secondTest.id, :result_id => @secondResult.id)
  end

  def createQuestions
    @questionSeven = Question.create(:question_text => "seventh", :value => 7, :personal_test_id => @secondTest.id )
    @questionEight = Question.create(:question_text => "eigth?", :value => 8, :personal_test_id => @secondTest.id)
    @questionNine = Question.create(:question_text => "ninth?", :value => 9, :personal_test_id => @secondTest.id)
    @questionTen = Question.create(:question_text => "tenth?", :value => 10, :personal_test_id => @secondTest.id)
    @questionEleven = Question.create(:question_text => "eleventh?", :value => 11, :personal_test_id => @secondTest.id)
    @questionTwelve = Question.create(:question_text => "A full dozen, yes?", :value => 12, :personal_test_id => @secondTest.id)
  end
  
  getData
  createQuestions
  answerQuestions(@secondSession)
  calculateResult(@secondSession)
end

# Take the test twice:
firstRun
secondRun
# Output the results:
puts "The first result is (should be 12):"
puts @firstSession.result.score.inspect
puts "The second result is (should be 30):"
puts @secondSession.result.score.inspect    
