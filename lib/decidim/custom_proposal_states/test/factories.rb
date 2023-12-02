# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :custom_proposal_states_component, parent: :component do
    name { Decidim::Components::Namer.new(participatory_space.organization.available_locales, :custom_proposal_states).i18n_name }
    manifest_name :custom_proposal_states
    participatory_space { create(:participatory_process, :with_steps) }
  end

  # Add engine factories here
end
