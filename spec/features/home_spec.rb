require 'rails_helper'
require 'debug'

describe "Home page", type: :feature do
  describe "Header" do
    describe "visiting the home page with properties registered" do
      before do
        Property.create(name: "Property name",
                        description: "description of the property",
                        address: "Avenida Paulista, 1000, São Paulo, SP",
                        value: 1000,
                        state: "São Paulo",
                        city: "São Paulo",
                        available_date: Date.today)
      end

      it "has the header with selectors" do
        visit '/'

        expect(page).to have_selector(:css, "div.topbar-wrapper")
        expect(page).to have_selector("a[href='#'][data-property-id='#{Property.first.id}']")
        expect(page).to have_css("nav.topbar")
      end

      it "has the header showing the properties name" do
        visit '/'

        within "nav.topbar" do
          expect(page).to have_link("Property name")
        end
      end
    end

    describe "visiting the home page without properties" do
      it "has the header without any property" do
        visit '/'

        within "nav.topbar" do
          expect(page).not_to have_link("Property name")
        end
      end

      it "has the header next and before property" do
        visit '/'

        expect(page).to have_css("button.scroll-btn")
        expect(page).to have_css("button.next")
        expect(page).to have_css("button.prev")
      end
    end
  end

  describe "Properties details" do
    before do
      property = Property.create(name: "Property name",
                      description: "description of the property",
                      address: "Avenida Paulista, 1000, São Paulo, SP",
                      value: 1000,
                      state: "São Paulo",
                      city: "São Paulo",
                      available_date: Date.today)

      property.photos.attach(io: File.open("spec/fixtures/image1.jpg"),
                             filename: 'mockfile.jpg')
    end

    it "each property has a dataset attribute" do
      visit '/'

      within("div#property-details") do
        expect(page).to have_selector("div[data-property-id='#{Property.first.id}']", visible: false)
      end
    end

    it "each property has a image tag" do
      visit '/'

      within("div#property-details") do
        expect(page).to have_selector("img", visible: false)
      end
    end

    it "each property has a image tag" do
      visit '/'

      within("div#property-details") do
        expect(page).to have_selector("h2", visible: false)
        expect(page).to have_selector("h2", text: "Property name", visible: false)
        expect(page).to have_selector("p", text: "description of the property", visible: false)
      end
    end
  end
end
