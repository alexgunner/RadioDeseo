class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.reverse
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @categories = Category.all.reverse
    @labels = Label.all.reverse
  end

  # GET /posts/1/edit
  def edit
    @categories = Category.all.reverse
    @labels = Label.all.reverse
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    
    respond_to do |format|
      if @post.save
        params[:categories].each do |category|
          PostCategory.register @post, category
        end
        params[:labels].each do |label|
          PostLabel.register @post, label
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        # We remove all the categories
        @post.post_categories.delete_all
        if !params[:categories].nil?
          params[:categories].each do |category|
            PostCategory.register @post, category
          end
        end

        # We remove all the labels
        @post.post_labels.delete_all
        if !params[:labels].nil?
          params[:labels].each do |label|
            PostLabel.register @post, label
          end
        end

        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.post_categories.delete_all
    @post.post_labels.delete_all
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content, categories: [:id, :val], labels: [:id, :val])
    end
end
