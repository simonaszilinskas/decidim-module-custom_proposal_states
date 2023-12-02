# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module CustomProposalStates
    # This is the engine that runs on the public interface of custom_proposal_states.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::CustomProposalStates

      routes do
        # Add engine routes here
        # resources :custom_proposal_states
        # root to: "custom_proposal_states#index"
      end
    end
  end
end
