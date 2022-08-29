# What we'll use
class HomeController < ApplicationController
  before_action :set_base_credentials
  require 'excon'

  def index
    # boards = Trello::Board.all
    url = "#{@base_url}/members/me/boards?fields=name,url&#{@credentials}"
    response = Excon.get(url)
    if response.status != 200
      @errors = response.body
      render 'errors'
    else
      @boards = JSON.parse(response.body)
    end
  end

  def show
    board_id = params[:id]
    @name = params[:name]
    url = "#{@base_url}/boards/#{board_id}/lists?cards=open&card_fields=name&fields=name,idBoard&#{@credentials}"
    response = Excon.get(url)
    if response.status != 200
      @errors = response.body
      render 'errors'
    else
      @lists = JSON.parse(response.body)
    end
  end

  def create_card
    list_id = params[:list_id]
    board_id = params[:board_id]
    title = params[:title]
    url = "#{@base_url}/cards?#{@credentials}"
    begin
    response = Excon.post(url, body: {
      "name": title,
      "idBoard": board_id,
      "idList": list_id
    }.to_json, headers: { 'Content-Type' => 'application/json' })
    response = JSON.parse(response.body)
    render partial: 'card', locals: { card: response, list: response }, status: :ok
    rescue Excon::Errors => e
    @errors = e
    render 'errors', status: :unprocessable_entity
    end
  end

  def update_card
    card_id = params[:id]
    title = params[:title]
    url = "#{@base_url}/cards/#{card_id}?#{@credentials}"
    begin
    response = Excon.put(url, body: {
      "name": title
      }.to_json, headers: { 'Content-Type' => 'application/json' })
    response = JSON.parse(response.body)
    render partial: 'card', locals: { card: response, list: response }, status: :ok
    rescue Excon::Errors => e
      @errors = e
      render 'errors', status: :unprocessable_entity
    end
  end

  def delete_card
    card_id = params[:id]
    url = "#{@base_url}/cards/#{card_id}?#{@credentials}"
    begin
    Excon.delete(url)
    rescue Excon::Errors => e
      @errors = e
      render 'errors', status: :unprocessable_entity
    end
  end

  private

  def set_base_credentials
    @base_url = 'https://api.trello.com/1'
    app_key = Rails.application.credentials.dig(:trello, :application_key)
    member_token = Rails.application.credentials.dig(:trello, :member_token)
    @credentials = "key=#{app_key}&token=#{member_token}"
  end
end
