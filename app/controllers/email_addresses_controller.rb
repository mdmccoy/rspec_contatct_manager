class EmailAddressesController < ApplicationController
  before_action :find_resource, only: [:edit, :update, :destroy]

  # GET /email_addresses/new
  def new
    @email_address = EmailAddress.new(contact_id: params[:contact_id], contact_type: params[:contact_type])
  end

  # GET /email_addresses/1/edit
  def edit
  end

  # POST /email_addresses
  def create
    @email_address = EmailAddress.new(email_address_params)

    respond_to do |format|
      if @email_address.save
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /email_addresses/1
  def update
    respond_to do |format|
      if @email_address.update(email_address_params)
        format.html { redirect_to @email_address.contact, notice: 'Email address was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /email_addresses/1
  def destroy
    contact = @email_address.contact
    @email_address.destroy
    respond_to do |format|
      format.html { redirect_to contact, notice: 'Email address was successfully destroyed.' }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def email_address_params
      params.require(:email_address).permit(:address, :contact_id, :contact_type)
    end
end
