class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    
    respond_to do |format|
      if @contact.save
        ContactMailer.new_contact_notification(@contact).deliver_later

        format.html do
          redirect_to root_path, notice: "Thanks for reaching out. We'll be in touch within the next 24 hours with details about your project."
        end

        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(
              "contact-form",
              partial: "landing_page/form",
              locals: { contact: Contact.new }
            ),
            turbo_stream.replace(
              "form-messages",
              partial: "landing_page/form_message",
              locals: { 
                type: "success",
                message: "Thanks for reaching out. We'll be in touch within the next 24 hours with details about your project."
              }
            )
          ]
        end
      else
        format.html do
          redirect_to root_path, alert: "There was an error submitting your request. Please try again."
        end

        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(
              "contact-form",
              partial: "landing_page/form",
              locals: { contact: @contact }
            ),
            turbo_stream.replace(
              "form-messages",
              partial: "landing_page/form_message",
              locals: { 
                type: "error",
                message: @contact.errors.full_messages.join(", ")
              }
            )
          ]
        end
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end