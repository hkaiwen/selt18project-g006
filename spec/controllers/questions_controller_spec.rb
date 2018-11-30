require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'GET index' do
    before :each do
      @questions = [[33, 'arduous means:', 'laborious', 'monstrous', 'ominous', 'perilous', 'easy'],
                    [34, 'pragmatic means:', 'alterable', 'realistic', 'relaxing', 'domesticated', 'medium'],
                    [36, 'gregarious means:', 'rustic', 'solemn', 'outgoing', 'frequent', 'easy']]
      @new_question = [[41, 'connect means to:', 'link', 'submit', 'assist', 'flood', 'hard'],
                       [13, 'energy means:', 'power', 'medicine', 'weaponry', 'experimentation','hard']]

    end
    it 'should render index template ' do
      expect(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4, :level).and_return(@questions)
      expect(get(:index)).to render_template('index')
    end
    it 'should alert for sign up after count of 10 questions' do
      session[:count] = 10
      allow(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4, :level).and_return(@questions)
      expect(get(:index)).to render_template('welcome/landing')
    end
    it 'should render different question if the question is already been taken' do
      session[:question] = ['arduous means:', 'pragmatic means:', 'gregarious means:']
      expect(Question).to receive(:pluck).with(:id,:questions, :answer, :option2, :option3, :option4, :level).and_return(@questions)
      get :index
    end
    it 'should add the question to session if is not already present' do
      session[:question] = ['pragmatic means:', 'arduous means:']
      expect(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4, :level).and_return(@new_question)
      get :index
      question = [@new_question[0][1], @new_question[1][1]]
      expect((session[:question] & question).empty?).to be(false)
    end
  end
  describe 'Add new question' do
    before :each do
      @question = 'The opposite of expensive is'
      @answer = 'cheap'
      @option1 = 'bear'
      @option2 = 'torn'
      @option3 = 'burnt'
      @explanation = 'The adjective expensive means high in price. Its like the expensive basketball sneakers you had to work all summer to save up enough money to buy.'
      @level = 'easy'
      @questions = Question.new(:questions => @question ,:answer => @answer, :option2 => @option2, :option3 => @option3, :option4 => @option1, :explanation => @explanation, :level => @level)
    end
    it 'should get the values from view' do
      expect(Question).to receive(:create_question!).with(@question, @answer, @option1, @option2, @option3, @explanation, @level).and_return(@questions)
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option2, :option4 => @option3, :explanation => @explanation, :level => @level}}
    end
    it 'should accept a boolean value as a result of calling model method' do
      expect(Question).to receive(:create_question!).with(@question, @answer, @option1, @option2, @option3, @explanation, @level).and_return(@questions)
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option2, :option4 => @option3, :explanation => @explanation, :level => @level}}

    end
    it 'should flash success message if question added to database and redirect to index page' do
      allow(Question).to receive(:create_question!).with(@question, @answer, @option1, @option2, @option3, @explanation, @level).and_return(@questions)
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option2, :option4 => @option3, :explanation => @explanation, :level => @level}}
      expect(flash[:notice]).to eq('Question successfully added to question bank')
      expect(response).to redirect_to(questions_path)
    end

    it 'should flash error message if question is not been added to the database' do
      allow(Question).to receive(:create_question!).with(@question, @answer, @option1, @option2, @option3, @explanation, @level).and_return(@questions)
      expect(@questions).to receive(:save).and_return(false)
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option2, :option4 => @option3, :explanation => @explanation, :level => @level}}
      expect(flash[:warning]).to eq('Question has already been taken')
      expect(response).to redirect_to(new_question_path)
    end

    it 'should return error message failed to add question to database and stay on the same page when missing multiple fields' do
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => nil, :option3 => nil, :option4 => @option3, :explanation => @explanation, :level => @level}}
      expect(response).to redirect_to(new_question_path)
      expect(flash[:warning]).to eq('Sorry, All fields are required')
    end

    it 'should return error message when missing option2 failed to add question to database and stay on the same page' do
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => nil, :option3 => @option2, :option4 => @option3, :explanation => @explanation, :level => @level}}
      expect(response).to redirect_to(new_question_path)
      expect(flash[:warning]).to eq("option2 can't be blank")
    end

    it 'should return error message if missing explaination while adding question and stay on the same page' do
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option3, :option4 => @option3, :explanation => nil, :level => @level}}
      expect(response).to redirect_to(new_question_path)
      expect(flash[:warning]).to eq("explanation can't be blank")
    end
    it 'should return error message if missing option4 while adding question and stay on the same page' do
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option3, :option4 => nil, :explanation => @explanation, :level => @level}}
      expect(response).to redirect_to(new_question_path)
      expect(flash[:warning]).to eq("option4 can't be blank")
    end
    it 'should return error message if missing option3 while adding question and stay on the same page' do
      post :create, {:question => {:question => @question, :answer => @answer, :option2 => @option1, :option3 => nil, :option4 => @option3, :explanation => @explanation, :level => @level}}
      expect(response).to redirect_to(new_question_path)
      expect(flash[:warning]).to eq("option3 can't be blank")
    end
    it 'should return error message if missing answer while adding question and stay on the same page' do
      post :create, {:question => {:question => @question, :answer => nil, :option2 => @option1, :option3 => @option2, :option4 => @option3, :explanation => @explanation, :level => @level}}
      expect(response).to redirect_to(new_question_path)
      expect(flash[:warning]).to eq("answer can't be blank")
    end
  end
  describe 'verifying answer' do
    context 'valid entry' do
      before :each do
        @checking_array = ['pragmatic means', 'alterable']
        @fake_results = {:value => anything, :answer => anything, :description => anything}
      end
      it 'should get the values from view' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, {:question => 'pragmatic means', :optradio => 'alterable' }
      end
      it 'should call the appropriate model method to verify answer' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
      end
      it 'should render index template' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
        expect(response).to redirect_to(/^.*\/questions\?action=submit_answer.*/)
      end
      it 'should flash message according to right or wrong answer' do
        fake_results = { :value => 'correct', :answer => anything, :description => anything }
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
        expect(flash[:correct]).to eq('Great! Your answer is correct')
      end
      it 'should make the verified results to index template' do
        expect(Question).to receive(:verify_answer).with(@checking_array).and_return(@fake_results)
        post :submit_answer, { :question => 'pragmatic means', :optradio => 'alterable'}
        expect(assigns(:reply_array)).to eq(@fake_results)
      end
    end
    context 'invalid entry' do
      it 'should check for null values from view' do
        post :submit_answer, { :opt_radio => ''}
        expect(flash[:notice]).to eq('Please select an answer')
        expect(response).to redirect_to(/^.*\/questions\?action=submit_answer.*/)
      end
    end
  end
  describe 'clear the session' do
    it 'should clear the session of counts and question on start' do
      session[:count] = 3
      session[:question] = ['celebration means:', 'The opposite of true is:']
      get :clear_session
      expect(session[:count]).to eq(0)
      expect(session[:question]).to eq(nil)
    end
  end
end
