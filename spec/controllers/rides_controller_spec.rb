require 'rails_helper'

RSpec.describe RidesController, type: :controller do
  describe "GET index" do
    it "assigns all rides as @rides"
  end

  describe "GET new" do
    it "assigns a blank ride to the view"
  end

  describe "POST create" do
    context "With valid params" do
      it "creates a new ride"
      it "assigns a newly created ride as @ride"
      # it "saves the ride without message error"
      it "redirects to the created ride"
    end

    context "With invalid params" do
      it "assigns a newly created but unsaved ride as @ride"
      it "raises an error if missing params"
      it "render to pending ride page/template"
    end
  end

  describe "GET show" do
    it "assigns the requested ride as @ride"
  end
end
