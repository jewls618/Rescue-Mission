require "rails_helper"

feature "Viewing questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }
  let!(:one) { Question.create(title: "A Question is only as long as the person asking the question, which is long, I hope.", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea. Why why why why is this not working") }
  let!(:two) { Question.create(title: "Second Question is just an extension of the first question which again is a long question", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea. Why why why why is this not working")}
  let!(:three) { Question.create(title: "Last Question is the final time I hope to have to write a nonsense question title that is longer", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea. Why why why why is this not working")}

  context "As a user" do
    context "I can click on the question to visit question show page" do
      before { visit questions_path }

      scenario "and the title for each question is a link" do
        click_link(one.title)

        expect(page).to have_content one.title
      end

      scenario "and sees the questions title and description on the show page" do
        click_link(two.title)

        expect(page).to have_content two.title
        expect(page).to have_content two.description
      end
    end
  end
end
