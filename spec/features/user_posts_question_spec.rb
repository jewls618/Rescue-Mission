require "rails_helper"

feature "Viewing questions" do

  context "As a user" do
    context "I can post a question" do
      before { visit questions_path }
      before { click_link("Ask Question") }

      scenario "user clicks a link to ask a new question" do
        expect(current_path).to eq(new_question_path)
        expect(page).to have_content("New Question")
      end

      scenario "and the title must be provided and more than 40 characters" do
        fill_in 'question_title', with: 'Why is this not working? Oh, I get it, because the title was not long enough'
        fill_in 'question_description', with: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea."
        click_button("Submit")

        expect(page).to have_content("Why is this not working?")
        expect(page).to_not have_content("Title is too short")

      end

      scenario "and the title must be provided and more than 40 characters" do
        fill_in 'question_title', with: 'This short title will not be accepted'
        click_button("Submit")

        expect(page).to have_content("Title is too short")
      end

      scenario "and the description must be provided and more than 150 char" do
        fill_in 'question_title', with: 'Why is this not working? Oh, I get it, because the title was not long enough'
        fill_in 'question_description', with: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea."
        click_button("Submit")

        expect(page).to have_content("This is not a long enough")
        expect(page).to_not have_content("Description is too short")
      end

      scenario "and presented with errors if form is incorrect" do
        click_button("Submit")

        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Description can't be blank")
      end
    end
  end
end
