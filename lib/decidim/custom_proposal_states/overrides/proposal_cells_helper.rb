# frozen_string_literal: true

module Decidim
  module CustomProposalStates
    module Overrides
      module ProposalCellsHelper
        def badge_name
          if model.emendation?
            humanize_proposal_state state
          else
            translated_attribute(model.proposal_state&.title)
          end
        end

        def state_classes
          return ["muted"] if model.state.blank?
          return ["alert"] if model.withdrawn?

          [model.proposal_state&.css_class]
        end
      end
    end
  end
end
