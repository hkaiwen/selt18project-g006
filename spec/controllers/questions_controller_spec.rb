require 'spec_helper'
require 'rails_helper'

describe QuestionsController do
  describe 'GET index' do
    before :each do
      @questions = [[33, 'arduous means:', 'laborious', 'monstrous', 'ominous', 'perilous'],
                    [34, 'pragmatic means:', 'alterable', 'realistic', 'relaxing', 'domesticated'],
                    [36, 'gregarious means:', 'rustic', 'solemn', 'outgoing', 'frequent']]
      @new_question = [41, 'connect means to;', 'link', 'submit', 'assist', 'flood']
    end
    it 'should render index template ' do
      expect(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4).and_return(@questions)
      expect(get(:index)).to render_template('index')
      #@controller = WelcomeController.new
      #post :landing
    end
    it 'should alert for signup after count of 10 questions to display' do
      @@tot_ques = []
      @@count = 10
      allow(Question).to receive(:pluck).with(:id, :questions, :answer, :option2, :option3, :option4).and_return(@questions)
      expect(get(:index)).to render_template('welcome/landing')
    end
  end
  describe 'render new question page' do
    it 'should render a new page' do
      expect(get(:new)).to render_template('new')
    end
  end
  describe 'Add new question' do
    before :each do
      @question = 'The opposite of expensive is:'
      @answer = 'cheap'
      @option1 = 'bare'
      @option2 = 'torn'
      @option3 = 'burnt'
      @explanation = 'The adjective expensive means high in price. Its like the expensive basketball sneakers you had to work all summer to save up enough money to buy.'
    end
    it 'should get the values from view' do
      expect(Question).to receive(:create_question!).with(@question, @answer, @option1, @option2, @option3, @explanation)
      post :create, {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option2, :option4 => @option3, :explanation => @explanation}
    end
    it 'should flash success message if question added to database' do
      fake_result = true
      expect(Question).to receive(:create_question!).with(@question, @answer, @option1, @option2, @option3, @explanation).and_return(fake_result)
      post :create, {:question => @question, :answer => @answer, :option2 => @option1, :option3 => @option2, :option4 => @option3, :explanation => @explanation}
      expect(flash[:notice]).to eq('Your question has been successfully added to the database')
    end

    it 'should redirect to index page'
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
        @post = {action: :submit_answer, controller: :questions}
        #@controller = {:controller => 'questions'}
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
end
