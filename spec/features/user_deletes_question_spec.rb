require "rails_helper"

feature "Deleting questions" do
  let!(:question) {Question.create(title: "A Question is going to be longer than I wanted it to be", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea.")}
  let!(:answer) {Answer.create(description: "An answer has to be at least fifty characters long which may be a bit annoying to some", question_id: question.id)}

  context "As a user" do
    context "I can delete a question" do
      before { visit questions_path }
      before { click_link question.title}

      scenario "user must be able to delete a question from the question edit page" do
        click_link("Edit Question")

        expect(current_path).to eq(edit_question_path(question[:id]))
        expect(page).to have_content("Delete")
      end

      scenario "or delete a question from the questions details page" do
        fill_in 'answer_description', with: 'I really hope this is at least 50 characters long to pass'

        expect(current_path).to eq(question_path(question[:id]))
        expect(page).to have_content("Delete")
      end

      scenario "and all answers associated with question must also delete" do
        click_link("Delete Question")

        expect(current_path).to eq(questions_path)
        expect(page).to_not have_content(question.title)
        expect{Answer.find(answer.id)}.to raise_error(ActiveRecord::RecordNotFound)

      end
    end
  end
end
