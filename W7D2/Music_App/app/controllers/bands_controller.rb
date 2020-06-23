class BandsController < ApplicationController
    def index
        @bands = Band.all

        render @bands
    end
end
