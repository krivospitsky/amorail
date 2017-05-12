module Amorail
  # AmoCRM lead entity
  class Lead < Amorail::Entity
    amo_names "leads"

    amo_field :name, :price, :status_id, :tags

    validates :name, :status_id, presence: true

    def reload
      @contacts = nil
      super
    end

    # Return list of associated contacts
    def contacts
      fail NotPersisted if id.nil?
      @contacts ||=
        begin
          links = Amorail::ContactLink.find_by_leads(id)
          links.empty? ? [] : Amorail::Contact.find_all(links.map(&:contact_id))
        end
    end

    # Return list of associated notes
    def notes
      fail NotPersisted if id.nil?
      @notes = Amorail::Note.find_by_lead(id)
    end
  end
end
