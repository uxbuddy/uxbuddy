module TestsHelper

  def uxbuddy_test_url
    request.original_url[0...-6]
  end

end
