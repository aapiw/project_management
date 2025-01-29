class JsonWebToken
    SECRET_KEY = Rails.application.secrets.secret_key_base
    EXP = 1.months

    def self.encode(payload)
      JWT.encode(payload.merge(exp:EXP.from_now.to_i), SECRET_KEY)
    end 
    
    def self.decode(token)
      decoded = JWT.decode(token, SECRET_KEY)[0]
      decoded.with_indifferent_access
    end
end