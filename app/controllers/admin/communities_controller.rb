class Admin::CommunitiesController < ApplicationController
  before_action :authenticate_admin!
end
