require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get sobre" do
    get pages_sobre_url
    assert_response :success
  end

  test "should get contato" do
    get pages_contato_url
    assert_response :success
  end

  test "should get termos_de_uso" do
    get pages_termos_de_uso_url
    assert_response :success
  end

  test "should get politica_de_privacidade" do
    get pages_politica_de_privacidade_url
    assert_response :success
  end

end
