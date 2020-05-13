
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FileUpload extends StatefulWidget {
  FileUpload({Key key}) : super(key: key);

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  String _filename ;
  String _path;
  Map<String,String> _paths ;
  String _extensions;
  bool _loadingPath=false;
  bool _multiPick=false;
  FileType _pickingType;
  TextEditingController _controller=new TextEditingController();
  @override
  void initState(){
    super.initState();
    _controller.addListener(()=>_extensions=_controller.text);
  }
  void _openFileExplorer() async{
    setState(()=>_loadingPath=true);
    try{
      if(_multiPick){
        _path=null;
        _paths=(await FilePicker.getMultiFile(
          type:_pickingType,
          allowedExtensions:(_extensions?.isNotEmpty ?? false)
          ?_extensions?.replaceAll(' ', '')?.split(','):null
        )) as Map<String, String>;
      }else{
        _path=null;
        _paths=(await FilePicker.getFilePath(
          type:_pickingType,
          allowedExtensions:(_extensions?.isNotEmpty ?? false)
          ?_extensions?.replaceAll(' ', '')?.split(','):null
        )) as Map<String, String>;
      }
    }on PlatformException catch(e){
      print("Unsupported operation" + e.toString());
    }
    if(!mounted)return;
    setState(() {
      _loadingPath = false;
      _filename = _path != null
          ? _path.split('/').last
          : _paths != null ? _paths.keys.toString() : '...';
    });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
              body: new Center(
            child: new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new DropdownButton(
                      hint: new Text('LOAD PATH FROM'),
                      value: _pickingType,
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(
                          child: new Text('FROM ANY'),
                          value: FileType.any,
                        ),
                        new DropdownMenuItem(
                          child: new Text('CUSTOM FORMAT'),
                          value: FileType.custom,
                        ),
                      ],
                      onChanged: (value) => setState(() {
                            _pickingType = value;
                            if (_pickingType != FileType.custom) {
                              _controller.text = _extensions = '';
                            }
                          })),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 100.0),
                  child: _pickingType == FileType.custom
                      ? new TextFormField(
                          maxLength: 15,
                          autovalidate: true,
                          controller: _controller,
                          decoration:
                              InputDecoration(labelText: 'File extension'),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                        )
                      : new Container(),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200.0),
                  child: new SwitchListTile.adaptive(
                    title: new Text('Pick multiple files',
                        textAlign: TextAlign.right),
                    onChanged: (bool value) =>
                        setState(() => _multiPick = value),
                    value: _multiPick,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.upload,
                      size: 40.0,
                      ),
                    onPressed: () => _openFileExplorer(),
                  ),
                ),
                new Builder(
                  builder: (BuildContext context) => _loadingPath
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator())
                      : _path != null || _paths != null
                          ? new Container(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: new Scrollbar(
                                  child: new ListView.separated(
                                itemCount: _paths != null && _paths.isNotEmpty
                                    ? _paths.length
                                    : 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final bool isMultiPath =
                                      _paths != null && _paths.isNotEmpty;
                                  final String name = 'File $index: ' +
                                      (isMultiPath
                                          ? _paths.keys.toList()[index]
                                          : _filename ?? '...');
                                  final path = isMultiPath
                                      ? _paths.values.toList()[index].toString()
                                      : _path;

                                  return new ListTile(
                                    title: new Text(
                                      name,
                                    ),
                                    subtitle: new Text(path),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        new Divider(),
                              )),
                            )
                          : new Container(),
                ),
              ],
            ),
          ))),
    );
  }
}