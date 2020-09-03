defmodule SimpleServer.Router do
    use Plug.Router
    use Plug.Debugger
    require Logger
  plug(Plug.Logger, log: :debug)
  
  
  plug(:match)
  
  plug(:dispatch)
  
  
  #Request>> First route will match when an incoming request path is /hello.
  #Response>> of 200 OK and send back the text “Hello World!”.
  get "/hello" do
    send_resp(conn, 200, "Hello World!")
end


  #Request>> Second route will matched when an incoming request path is /hello/:param
  #Response>> of 200 OK and send back the text “Hello :param”.

get "/hello/:param" do
  send_resp(conn, 200, " Hello #{param} ") 
end



#Default route if route is'nt matched

match _ do

send_resp(conn, 404, "not found")

end
  
end

