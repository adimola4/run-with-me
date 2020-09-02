module ApplicationHelper

    def join_to_training(training)
        partner = Partner.find_by(training_id: training.id, user_id: current_user.id)
        if partner
          unless  partner.id.nil?
            link_to('Remove Me', training_partner_path(id: partner.id, training_id: training.id), method: :delete, class: 'btn  btn-sm justify-content-center d-flex mx-auto')
          end
        else
          link_to('Join Me 🏃🏽‍♀️', training_partners_path(training_id: training.id, ), method: :post, class: 'btn  btn-sm justify-content-center d-flex mx-auto')
        end
    end
  
    def create_google_map_link(location) # TODO: Add zipcode to url
      url="https://www.google.com/maps/search/?api=1&query="+location.to_s
      
      link_to(location, url , class: ' d-flex mx-auto') 
    end

end
