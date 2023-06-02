class GroupsController < ApplicationController
    def index
        @groups = Group.all
        @user = current_user
    end
    
    def new
        @group = Group.new
    end
    
    def create
        @group = Group.new(group_params)
        @group.author_id = current_user.id
        if @group.save
            redirect_to authenticated_root_path, notice: 'Group was successfully created.'
        else
            render :new
        end
    end

    private
    
    def group_params
        params.require(:group).permit(:name, :icon)
    end   
end
