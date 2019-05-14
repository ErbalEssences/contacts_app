class Api::ContactsController < ApplicationController

  def index
    if current_user
        @contacts = Contact.all
        search = params[:search]
        info = params[:info]
    else
      render json: []
    end

    # first_name_search = params[:first_name]
    # middle_name_search = params[:middle_name]
    # last_name_search = params[:last_name]
    # phone_search = params[:first_name]
    # email_search = params[:middle_name]  

    # if first_name_search
    #   @contacts = @contacts.where("first_name iLIKE ?", "%#{first_name_search}%")
    # elsif middle_name_search
    #   @contacts = @contacts.where("middle_name iLIKE ?", "%#{middle_name_search}%")
    # elsif last_name_search
    #   @contacts = @contacts.where("last_name iLIKE ?", "%#{last_name_search}%")
    # elsif phone_search
    #   @contacts = @contacts.where("phone_number iLIKE ?", "%#{phone_search}%")
    # elsif email
    #   @contacts = @contacts.where("email iLIKE ?", "%#{last_name_search}%")
    # end

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

    # options = ["first_name", "middle_name", "last_name", "phone_number", "email", "bio"]
    # if options.include? search
    #   # @contacts = @contacts.where(search} iLIKE ?", "%#{info}%")
    #   @contacts = @contacts.where("#{search} iLIKE ?", "%#{info}%")
    # end


    render 'index.json.jbuilder'
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
