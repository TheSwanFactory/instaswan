require 'open-uri'
require 'RMagick'

class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
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

    respond_to do |format|
      if @photo.save
        apply_filter(@photo.filter)
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
  def destroy
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
     
    def get_base_image
      url = URI.parse("http:#{@photo.base_url}")
      f = open(url)
      blob = f.read
      ilist = Magick::ImageList.new
      ilist.from_blob(blob)
      return ilist
    end
    
    def upload_image(image)
      key = "uploads/#{SecureRandom.uuid}/#{@photo.name}.png}"
      s3 = Aws::S3::Resource.new
      obj = S3_BUCKET.object(key)
      obj.put(body: image.to_blob)
      return obj.public_url
    end
     
    def apply_filter(effect)
      if effect
        base = get_base_image
        image = base.send(effect.to_sym)
        @photo.final_url = upload_image(image)
      else
        @photo.final_url = @photo.base_url
      end
      @photo.save
    end
     
    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:name, :base_url, :filter, :final_url)
    end
end
