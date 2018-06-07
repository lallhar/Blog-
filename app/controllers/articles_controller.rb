class ArticlesController < ApplicationController

	before_action :set_articles, only: [:show, :edit, :destroy, :update]

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)	
	end

	def new
		@article = Article.new
	end

	def edit
				
	end

	def create		
		
		@article = Article.new(article_params)
		@article.user = User.first
		if @article.save
			#do something
			flash[:success] = "Artcile was successfully created. Congratulations!"
			redirect_to article_path(@article)
		else
			render 'new'
		end		
	end

	def show
		
	end

	def destroy
		
		@article.destroy
		flash[:danger] = "Your Article was successfully deleted. Meh!"
		redirect_to articles_path
		
	end

	def update
		
		if @article.update(article_params)
				flash[:success] = " Your Article was successfully updated. Thanks"
				redirect_to article_path(@article)
			else
				render 'edit'
		end		
	end

	private

	def set_articles
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end

end