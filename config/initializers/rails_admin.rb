RailsAdmin.config do |config|
  config.current_user_method(&:current_user)

  ### Popular gems integration

  config.authorize_with do |controller|
    if current_user.nil?
      redirect_to main_app.root_path
    elsif !current_user.admin?
      redirect_to main_app.root_path
    end
  end
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['Feedback']
    end
    bulk_delete
    show
    edit do
      except ['User', 'Feedback']
    end
    delete do
      except ['User', 'Feedback']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    edit do
      exclude_fields :feedbacks
    end
  end
end
