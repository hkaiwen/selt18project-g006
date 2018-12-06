module RailsAdmin
  module Config
    module Actions
      class Customaction < RailsAdmin::Config::Actions::Base
        register_instance_option :member do  #	this is for specific record
          true
        end
        register_instance_option :visible? do

        end
      end
      class Foo < Customaction
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :only do
          :new
        end
        register_instance_option :controller do
          proc do
            if request.get?
              puts "hi"
              log_msg = "question was:"+ action_name+"d"
              ActivityLog.create(:item_type => 'question', :item_id => "id", :act_action => 'add', :updated_by => current_user.first_name, :activity => log_msg, :act_tstamp => Time.now)
            end
          end
        end
       end
    end
  end
end
