import cherrypy


class HelloWorld(object):
    @cherrypy.expose
    def index(self):
        return "Hello World!"


cherrypy.server.socket_host = "0.0.0.0"
cherrypy.quickstart(HelloWorld())