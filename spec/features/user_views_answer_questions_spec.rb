require "rails_helper"

feature "Viewing answers" do
  let!(:one) {Question.create(title: "A Question is going to be longer than I wanted it to be", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea.")}
  let!(:answer) {Answer.create(description: "This is a really long answer so it will pass the length test for my validations.", question_id: one.id)}
  let!(:answer2) {Answer.create(description: "This is a NOT really long answer so it will pass the length test for my validations.", question_id: one.id)}

  context "As a user" do
    context "I can view the answers for a question" do
      before { visit questions_path }
      before { click_link one.title }

      scenario "user must be on the question detail page" do
        expect(current_path).to eq(question_path(one[:id]))
      end

      scenario "and only see answers to the question user is viewing" do
        expect(page).to have_content("This is a really long answer")
      end


      scenario "and sees the answers listed in order of most recent first" do
        expect(page).to have_selector("li:last-child", text: answer2.description)
      end
    end
  end
end
