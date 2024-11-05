defmodule LandingPageWeb.PageController do
  use LandingPageWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, "home.html")
  end

  def about(conn, _params)do
    render(conn,"about.html")
  end
  def contact(conn,_params) do
    render(conn, "contact.html")
  end
end
