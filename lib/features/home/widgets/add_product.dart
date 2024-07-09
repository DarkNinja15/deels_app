import 'dart:io';

import 'package:deels_app/common/AppColors/app_colors.dart';
import 'package:deels_app/features/home/widgets/modal_fields.dart';
import 'package:deels_app/services/cloudinary_storage.dart';
import 'package:deels_app/services/firestore_service.dart';
import 'package:deels_app/store/store.dart';
import 'package:deels_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddItemForm extends StatefulWidget {
  const AddItemForm({super.key});

  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final ImagePicker _picker = ImagePicker();
  final store=Get.find<Store>();
  XFile? _image;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Sell Item', style: TextStyle(color: AppColors.blackColor, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 347/2,
                    height: 194/2,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10.0,
                          spreadRadius: 0.02,
                          offset: const Offset(0.0, 0.0),
                        )
                    
                      ]
                    ),
                    child: _image == null
                        ? const Icon(Icons.add_a_photo, size: 40, color: AppColors.greyColor)
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(File(_image!.path),fit: BoxFit.cover,)),
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child:  Text(
                    'Required size 347x194\nMax size 1MB\nSupported formats .jpg, .jpeg, .png',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ModalFields(labelText: 'Title',prefixIcon: Icons.title,maxLength: 20,maxLines: 1,onChanged: (p0)=>store.product.title=p0, ),
            const SizedBox(height: 16),
            ModalFields(labelText: 'Description',prefixIcon: Icons.description,maxLength: 100,maxLines: 1,onChanged: (p0)=>store.product.description=p0,),
            const SizedBox(height: 16),
            ModalFields(labelText: 'Tags(Comma seperated)', prefixIcon: Icons.tag, maxLines: 1, maxLength: 100,onChanged: (p0){
              store.product.tags=p0.split(',');
            },),
            const SizedBox(height: 16),
            ModalFields(labelText: 'Price', prefixIcon: Icons.currency_rupee, maxLines: 1, maxLength: 10,keyboardType: TextInputType.phone,onChanged: (p0) => store.product.price=double.tryParse(p0)??0.0,),
            const SizedBox(height: 16),
            _isLoading? const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),): GestureDetector(
              onTap: ()async{
                if(store.product.title.isEmpty||store.product.description.isEmpty||store.product.price==0.0||store.product.tags.isEmpty||_image==null){
                  Utils.snackBar('Error', 'Please fill all the fields');
                  return;
                }
                setState(() {
                  _isLoading=true;
                });

                store.product.imageUrl = await CloudianryStorage.cloudFileUpload(_image!) ?? "";
                
                if(store.product.imageUrl==""){
                  Utils.snackBar('Error', 'Unable to upload image');
                  return;
                }

                FirestoreService.addProduct();

                setState(() {
                  _isLoading=false;
                });
              },
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Sell Item',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
