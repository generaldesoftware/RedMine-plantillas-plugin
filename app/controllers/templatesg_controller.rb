class TemplatesgController < ApplicationController
  unloadable
  model_object WikiTemplatesg
  layout 'admin'
  
  before_filter :require_admin

  def index
@templates = WikiTemplatesg.find(:all)
    render :action => "index", :layout => false if request.xhr?
  end

  def new
    #if  User.current.allowed_to?(:create_templates, @project) && request.post?
    if request.post?
      @mitemplate = WikiTemplatesg.new
      @mitemplate.text = params[:mitemplate][:text]
      @mitemplate.name = params[:mitemplate][:name]
      @mitemplate.author_id = User.current
      @mitemplate.save
      redirect_to :controller => 'templatesg', :action => 'index'
    end
  end

  def destroy
    @mitemplate = WikiTemplatesg.find(params[:id])
    if @mitemplate
    #if User.current.allowed_to?(:delete_templates, @project)  && @mitemplate
      @mitemplate.destroy
      flash[:notice] = l(:label_template_delete)
    end
    redirect_to :controller => 'templatesg', :action => 'index'
  end

  def edit
    if request.post?
    #if User.current.allowed_to?(:edit_templates, @project) && request.post?
      @mitemplate = WikiTemplatesg.find(params[:id])
      @mitemplate.text = params[:mitemplate][:text]
      @mitemplate.name = params[:mitemplate][:name]
      @mitemplate.save
      flash[:notice] = l(:notice_successful_update)
      redirect_to :controller => 'templatesg', :action => 'index'
    else 
      @mitemplate = WikiTemplatesg.find(params[:id])
    end	
  end
end

