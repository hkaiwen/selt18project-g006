Given /the following questions have been added to Question:/ do |question_table|
  question_table.hashes.each do |question|
    Question.create(question)
  end
end

Given /^I am on the question page$/ do
  visit questions_path
end

When /^I click on 'Next' button/ do
  @current_question
  page.all('h1').each do |a|
    if Question.find_by_questions(a.text) != nil
      @previous_question = a.text
    end
  end
  click_button('Next')
end

Then /^I should get a new question$/ do
  page.all('h1').each do |a|
    if Question.find_by_questions(a.text) != nil
      expect a.text != @previous_question
    end
  end
end
