require "rails_helper"

feature "Viewing questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }
  let!(:one) {Question.create(title: "Cupcake ipsum dolor sit amet? Who the heck knows what the even means. Nobody.", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea.")}
  let!(:two) {Question.create(title: "Cupcake ipsum dolor sit amet? Who the heck knows what the even means. Nobody.", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea.")}
  let!(:three) {Question.create(title: "Cupcake ipsum dolor sit amet? Who the heck knows what the even means. Nobody.", description: "This is not a long enough descrption so I have to add these extra characters in order to pass my validations. Really hope this is long enough now. Why are all of my tests still failing? I really have no idea.")}

  context "As a user" do
    context "I can visit the questions page" do
      before { visit questions_path }

      scenario "and see the title for each question" do
        questions.each do |q|
          expect(page).to have_content q.title
        end
      end

      scenario "and sees the questions listed in order of most recent first" do
        expect(page).to have_selector("td:first-child", text: three.title)
        expect(page).to have_content three.title
      end
    end
  end
end
