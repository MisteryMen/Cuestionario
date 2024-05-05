import 'dart:convert';
import 'dart:io';


void main() async {
  try {
    ServerSocket server = await ServerSocket.bind('127.0.0.1', 4040);
    print('Servidor escuchando en ${server.address}:${server.port}');

    await for (Socket socket in server) {
      print(
          'Cliente conectado desde ${socket.remoteAddress}:${socket.remotePort}');

      // Recibir datos del cliente
      socket.listen(
        (List<int> data) {
          String mensaje = utf8.decode(data);
          print('Mensaje recibido del cliente: $mensaje');

          // Procesar el mensaje
          Map<String, dynamic> datos = jsonDecode(mensaje);
          socket.writeln('Objeto recibido $datos');
          socket.close();
        },
        onError: (error) {
          print('Error de conexión: $error');
          socket.close();
        },
        onDone: () {
          print('Cliente desconectado');
        },
      );
    }
  } catch (e) {
    print('Error al iniciar el servidor: $e');
  }
}
