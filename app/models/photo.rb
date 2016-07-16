
class Photo < ApplicationRecord
    EFFECTS = %w(
        charcoal
        emboss
        implode
        oil_point
        polaroid
        sepiatone
        shadow
        sketch
        solarize
        swirl
        vignette
        wave
        wet_floor
    )
    validates :name, presence: true
    validates :base_url, presence: true   
end
