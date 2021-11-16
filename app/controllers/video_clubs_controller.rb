class VideoClubsController < ApplicationController
  def index
    @video_clubs = policy_scope(VideoClub)
    @markers = @video_clubs.geocoded.map do |video_club|
      {
        lat: video_club.latitude,
        lng: video_club.longitude,
        info_window: render_to_string(partial: "info_window", locals: { video_club: video_club })
      }
    end
  end

  def show
    @video_club = VideoClub.find(params[:id])
    authorize @video_club
  end
end
