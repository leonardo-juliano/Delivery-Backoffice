
import 'dart:html';
import 'dart:typed_data';

typedef UploadCallback = void Function(Uint8List file,String fileName);

class UploadHtmlHelper {

  //metodo para poder selecionar o arquivo
  void startUpload(UploadCallback callback) {
    final uploadInput = FileUploadInputElement();
    uploadInput.click();
    uploadInput.onChange.listen((_){ //escuta os arquivos que esta selecionando 
      handleFileUploaded(uploadInput, callback); 
    });
  }

  //faz o upload
  void handleFileUploaded(
    FileUploadInputElement uploadInput,
    UploadCallback callback,
  ){
    final files = uploadInput.files;
    if (files != null && files.isNotEmpty) {
      final file = files.first;
      final reader = FileReader();
      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((_) {
        final bytes = Uint8List.fromList(reader.result as List<int>);
        callback(bytes, file.name);
      });

    }
  }
  
}