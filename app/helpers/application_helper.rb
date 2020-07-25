module ApplicationHelper
    def menu_link_to(link_text, link_path)
        class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'
    
        content_tag(:div, class: class_name) do
          link_to link_text, link_path
        end
      end
    
      def join_to_training(training)
        partner = Partners.find_by(training_id: training.id, user_id: current_user.id)
        if partner
          
          link_to('More details', post_like_path)
        else
          link_to('Join', new_training_partner_path(training_id: training.id, user_id: current_user.id), method: :post)
        end
      end
end
