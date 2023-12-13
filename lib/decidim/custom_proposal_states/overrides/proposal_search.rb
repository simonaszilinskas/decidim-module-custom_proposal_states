# frozen_string_literal: true

module Decidim
  module CustomProposalStates
    module Overrides
      module ProposalSearch
        def self.prepended(base)
          base.class_eval do
            def custom_states
              @custom_states ||= Decidim::CustomProposalStates::ProposalState.not_system.where(component: component).pluck(:token)
            end

            # Handle the state filter
            def search_state
              scopes = %w(accepted rejected evaluating state_not_published) + custom_states

              apply_scopes(scopes, state)
            end

            def apply_scopes(scopes, search_values)
              search_values = Array(search_values)

              conditions = scopes.map do |scope|
                search_values.member?(scope.to_s) ? query.try(scope) : nil
              end.compact

              additional_conditions = search_values & custom_states

              conditions.push(query.only_status(additional_conditions)) if additional_conditions.any?

              return query unless conditions.any?

              scoped_query = query.where(id: conditions.shift)

              conditions.each do |condition|
                scoped_query = scoped_query.or(query.where(id: condition))
              end

              scoped_query
            end
          end
        end
      end
    end
  end
end
