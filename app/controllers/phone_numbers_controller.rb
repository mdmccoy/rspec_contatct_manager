class PhoneNumbersController < ApplicationController
  before_action :find_resource, only: [:edit, :update, :destroy]

  # GET /phone_numbers/new
  def new
    # @phone_number = PhoneNumber.new(person_id: params[:person_id])
    @phone_number = PhoneNumber.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  # GET /phone_numbers/1/edit
  def edit
  end

  # POST /phone_numbers
  def create
    @phone_number = PhoneNumber.new(phone_number_params)


    respond_to do |format|
      if @phone_number.save
        format.html { redirect_to @phone_number.contact, notice: 'Phone number was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /phone_numbers/1
  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to @phone_number.contact, notice: 'Phone number was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /phone_numbers/1
  def destroy
    contact = @phone_number.contact
    @phone_number.destroy
    respond_to do |format|
      format.html { redirect_to contact, notice: 'Phone number was successfully destroyed.' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def phone_number_params
      params.require(:phone_number).permit(:number, :contact_id, :contact_type)
    end
end
