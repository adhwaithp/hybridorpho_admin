import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hybridorpho_admin/common_widget/custom_alert_dialog.dart';
import 'package:hybridorpho_admin/common_widget/custom_image_picker_button.dart';
import 'package:hybridorpho_admin/util/file_upload.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../common_widget/custom_button.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<String> _imageUrls = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    Supabase.instance.client.from('gallerys').select('*').then((response) {
      final data = response;
      final images = data.map((image) {
        return image['image'] as String;
      }).toList();

      setState(() {
        _imageUrls.clear();
        _imageUrls.addAll(images);
      });
    }).onError((e, s) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error fetching users: ${e!.toString()}")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Gallery",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomButton(
                inverse: true,
                iconData: Icons.add,
                label: 'Add Image',
                onPressed: () {
                  showDialog(context: context, builder: (context) => AddImage())
                      .then((va) => getData());
                },
              ),
            ],
          ),
        ),
        if (_imageUrls.isEmpty)
          Expanded(
            child: Center(
              child: Text("No images found"),
            ),
          )
        else
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: 'Remove Image',
                        description:
                            'Are you sure you want to remove this image?',
                        primaryButton: 'Remove',
                        onPrimaryPressed: () async {
                          await Supabase.instance.client
                              .from('gallerys')
                              .delete()
                              .eq('image', _imageUrls[index]);
                          Navigator.pop(context);
                          getData();
                        },
                        secondaryButton: 'Cancel',
                        onSecondaryPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  child: Image.network(
                    _imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class AddImage extends StatefulWidget {
  const AddImage({
    super.key,
  });

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  PlatformFile? _image;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      isLoading: isLoading,
      title: 'Add Image',
      content: Column(
        children: [
          CustomImagePickerButton(
            borderRadius: 0,
            width: double.infinity,
            height: 200,
            onPick: (pick) {
              _image = pick;
              setState(() {});
            },
          ),
        ],
      ),
      primaryButton: 'Add Image',
      onPrimaryPressed: () async {
        if (_image != null) {
          setState(() {});
          isLoading = true;
          String uploadedimage = await uploadFile(
            'image',
            _image!.bytes!,
            _image!.name,
          );
          await Supabase.instance.client.from('gallerys').insert({
            'image': uploadedimage,
          });
          Navigator.pop(context);
        }
      },
    );
  }
}
