module Amorail
  # AmoCRM lead entity
  class Note < Amorail::Entity
    amo_names "notes"

    def find_by_lead(l)
      response = client.safe_request(
        :get,
        remote_url('list'),
        type: 'lead',
        element_id: l
      )
      load_many(response)
    end
  end
end
