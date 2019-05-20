class Api::ContactsController < ApplicationController


    def index
        if current_user
            @contacts = current_user.contacts
            search = params[:search]
            info = params[:info]
            group_name = params[:group]

            if group_name
              group = Group.find_by(name: group_name)
              @contacts = group.contacts
            end

            if search
              @contacts = @contacts.where("first_name iLIKE ? OR middle_name iLIKE ? OR last_name iLIKE ? OR email iLIKE ? OR phone_number iLIKE ? OR bio iLIKE ?", 
                "%#{search}%",
                "%#{search}%",
                "%#{search}%",
                "%#{search}%",
                "%#{search}%",
                "%#{search}%"
                )
            end

            render 'index.json.jbuilder'
        else
          render json: []
        end
    end

  def create
    @contact = Contact.new(
                            first_name: params[:first_name],
                            middle_name: params[:middle_name],
                            last_name: params[:last_name],
                            email: params[:email],
                            phone_number: params[:phone_number],
                            bio: params[:bio]
                            )
    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: { message: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end  

  def show
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio

    if @contact.save
      render 'show.json.jbuilder'
    else
      render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    render json: {message: "Successfully destroyed contact"}
  end

end
