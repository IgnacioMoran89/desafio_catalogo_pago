class Credit < ApplicationRecord
    has_many :transbanks, as: :transbankable
end
