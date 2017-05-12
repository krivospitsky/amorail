module Amorail
  # AmoCRM lead entity
  class Note < Amorail::Entity
    amo_names "notes"

      amo_field :text, :note_type
  end
end
