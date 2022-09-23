class Friend < ApplicationRecord
    belongs_to:user
    ###add vaildation phone
    validates:Phone, format: { with:/((\+(88)){1})?((01){1})([3-9]{1}\d{8})\b/, message: "only bd phone number" }
    ###add validation email
    validates:Email, format:{with:/([a-zA-Z]+[0-9]*(\@)(gmail)(\.)(com))\b/, message: "please enter valid email" }
end
