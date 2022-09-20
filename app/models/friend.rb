class Friend < ApplicationRecord
    belongs_to:user
    ###add vaildation phone
    validates:Phone, format: { with:/((\+(88)){1})?((01){1})([3-9]{1}\d{8})\b/, message: "only bd phone number" }
    # another ###((\+)88)?(01)([3-9]\d{8})\b
    ###add validation email
    validates:Email, format:{with:/([a-zA-Z]+[0-9]*(\@)(gmail)(\.)(com))\b/, message: "please enter valid email" }
    #another ##[a-zA-Z]+[0-9]*((\.|\_){1})?([a-zA-Z0-9]+)(\@)(gmail)(\.)(com))\b
end
