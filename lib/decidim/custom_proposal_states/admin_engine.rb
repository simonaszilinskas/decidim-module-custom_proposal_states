# frozen_string_literal: true

module Decidim
  module CustomProposalStates
    # This is the engine that runs on the public interface of `CustomProposalStates`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::CustomProposalStates::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :custom_proposal_states do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "custom_proposal_states#index"
      end

      def load_seed
        nil
      end
    end
  end
end
