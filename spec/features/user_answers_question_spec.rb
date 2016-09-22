require "rails_helper"

feature "Answering questions" do
  let!(:one) {Question.create(title: "A Question is going to be longer than I wanted it to be", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea.")}

  context "As a user" do
    context "I can answer another user's question" do
      before { visit questions_path }
      before { click_link one.title}

      scenario "user must be on the question detail page" do
        expect(current_path).to eq(question_path(one[:id]))
      end

      scenario "and provide a description of at least 50 characters" do
        fill_in 'answer_description', with: 'I really hope this is at least 50 characters long to pass'
        click_button("Submit")

        expect(page).to have_content("I really hope this is at least")
        expect(page).to_not have_content("Description is too short")
        expect(current_path).to eq(question_path(one[:id]))
      end

      scenario "and provide a description of at least 50 characters" do
        fill_in 'answer_description', with: 'This is not long enough'
        click_button("Submit")

        expect(page).to have_content("Description is too short")
        expect(current_path).to eq(question_path(one[:id]))
      end

      scenario "and presented with errors if form is incorrect" do
        click_button("Submit")

        expect(page).to have_content("Description can't be blank")
      end
    end
  end
end
