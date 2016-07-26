require 'open-uri'
require 'RMagick'

class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  before_filter :authenticate_user!

  # GET /photos
  # GET /photos.json
  def index
    #@photos = Photo.all
    @photos = current_user.photos.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    
    respond_to do |format|
      if @photo.save
        apply_filter() if @photo.filter
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  
  def extract_key(url)
    return URI.split(url)[5] rescue "no_key"
  end

  def destroy
    base_key = extract_key(@photo.base_url)
    final_key = extract_key(@photo.final_url)
    
    #puts "base #{base_key} final #{final_key}"
    S3_BUCKET.delete_objects({
      delete: { # required
        objects: [ # required
          { key: base_key },
          { key: final_key },
        ],
      }
    })
    
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    def set_s3_direct_post
       @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
     end
     
     def apply_filter()
       effect = @photo.filter.to_sym
       puts "Applying #{effect} to #{@photo}"
       url = URI.parse("http:#{@photo.base_url}")
       f = open(url)
       blob = f.read
       ilist = Magick::ImageList.new
       ilist.from_blob(blob)
       image = ilist.send(effect)
       
       key = "uploads/#{SecureRandom.uuid}/#{@photo.name}.png"
       obj = S3_BUCKET.object(key)
       obj.put(body: image.to_blob, acl: 'public-read')
       @photo.final_url = obj.public_url
       @photo.save
     end
     
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:name, :base_url, :filter, :final_url)
    end
end
