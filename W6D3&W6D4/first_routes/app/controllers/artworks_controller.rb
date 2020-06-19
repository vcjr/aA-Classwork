class ArtworksController < ApplicationController
    def index
        if params.has_key?(:user_id) #params is a hash like object that has parameters from get request (clarify with ta)
            @artworks = Artwork
                .select('DISTINCT *')
                .joins(:artwork_shares)
                .where('artworks.artist_id = :id OR artwork_shares.viewer_id = :id', id: params[:user_id]) #might be artist_id and would be user's artwork, and would be hash-like object
        end
        render json: @artworks # we want objects, converts collection of relations into artworks
    end
            
            
            # @user = User.find_by(id: params[:user_id])
            # @artworks = Artwork.find_by(artist_id: @user).joins(:artwork_shares)
            # @artwork_shares = ArtworkShare.find_by(artist_id: @user)
            # @result = @artworks
            # @artwork_shares
            # render json: @result
            

        # We are in artworks and we want to return our own artworks but 
        # also artworks that we are sharing with a particular user
        # we have to find the id of that user and after we have their id we 
        # have to find all of the artworkshares to that artist id
    # end
    
    def show
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork
    end
    # params.require(:superhero).permit(:name, :secret_identity, :power)
    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save 
            redirect_to artworks_url
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])

        if @artwork.destroy
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def like_and_dislike
        # if params
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end
end