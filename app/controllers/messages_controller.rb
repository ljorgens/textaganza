class MessagesController < ApplicationController
  def new
  end

  def initialize(attributes)
    @to = attributes['to']
    @from = attributes['from']
    @body = attributes['body']
  end
end
