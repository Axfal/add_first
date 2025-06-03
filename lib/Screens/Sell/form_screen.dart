// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:olx_app/resources/exports.dart';
import '../../model/category_model/attributes_model.dart';

class DynamicPostFormScreen extends StatefulWidget {
  final int categoryId;
  const DynamicPostFormScreen({super.key, required this.categoryId});

  @override
  DynamicPostFormScreenState createState() => DynamicPostFormScreenState();
}

class DynamicPostFormScreenState extends State<DynamicPostFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<int, dynamic> formValues = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() => getAttributes());
  }

  void getAttributes() async {
    final attributeProvider =
        Provider.of<AttributeProvider>(context, listen: false);
    await attributeProvider.getAttributes(widget.categoryId);
  }

  Widget buildField(Fields field) {
    final int id = field.fieldId ?? 0;
    final String name = field.fieldName ?? '';
    final String type = field.fieldType ?? 'text';
    final bool required = field.isRequired ?? false;
    final List<String> options = field.options ?? [];

    Widget child;

    switch (type) {
      case 'text':
      case 'number':
        child = TextFormField(
          keyboardType:
              type == 'number' ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: name,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
          validator: required
              ? (val) => val == null || val.isEmpty ? 'Required' : null
              : null,
          onChanged: (val) => formValues[id] = val,
        );
        break;
      case 'select':
        child = DropdownButtonFormField<String>(
          value: formValues[id], // <- add this line
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            filled: true,
            fillColor: Colors.grey.shade100,
            hintText: name,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
          items: options
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (val) {
            setState(() {
              formValues[id] = val;
            });
          },
          validator:
              required ? (val) => val == null ? 'is_required' : null : null,
        );

        break;
      case 'checkbox':
        child = Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontSize: 16)),
            Switch(
              activeColor: AppColor.primaryColor,
              value: formValues[id] ?? false,
              onChanged: (val) => setState(() => formValues[id] = val),
            ),
          ],
        );
        break;
      case 'file':
        child = buildImageUploadGrid(id);
        break;
      default:
        child = const SizedBox.shrink();
    }

    return type == 'file'
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 6,
                )
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: child,
          )
        : child;
  }

  Widget buildImageUploadGrid(int id) {
    final List<XFile> images = List<XFile>.from(formValues[id] ?? <XFile>[]);

    Future<void> pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null && images.length < 14) {
        setState(() {
          images.add(pickedImage);
          formValues[id] = images;
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Upload up to 14 Images",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          itemCount: images.length < 14 ? images.length + 1 : 14,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            // Handle the 'add photo' button
            if (index == images.length && images.length < 14) {
              return GestureDetector(
                onTap: pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: const Icon(Icons.add_a_photo, color: Colors.black54),
                ),
              );
            }

            // Handle normal images
            if (index < images.length) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: FileImage(File(images[index].path)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          images.removeAt(index);
                          formValues[id] = images;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        child: const Icon(Icons.close,
                            size: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 6),
        Text('${images.length}/14 images selected',
            style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final attributeProvider = Provider.of<AttributeProvider>(context);
    final validFields = attributeProvider.attributesModel?.fields
        ?.where((field) => field.fieldType != null && field.fieldName != null)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: buildAppBar(context, "Create Ad"),
      body: attributeProvider.loading
          ? const Center(child: CupertinoActivityIndicator())
          : validFields == null || validFields.isEmpty
              ? const Center(child: Text("Form is empty"))
              : Form(
                  key: _formKey,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: validFields.length,
                    itemBuilder: (context, index) =>
                        buildField(validFields[index]),
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                  ),
                ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              elevation: 6,
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final userJson = await MySharedPrefs().getUserData();
                final userMap = jsonDecode(userJson!);
                final userId = userMap['id'].toString();
                print("userId => $userId");

                List<Map<String, dynamic>> formDataList = [];

                formValues.forEach((key, value) {
                  if (value == null) return;

                  if (value is List<XFile>) {
                    List<String> paths = value.map((file) => file.path).toList();
                    formDataList.add({
                      "key": "field_${key}[]",
                      "type": "file",
                      "src": paths,
                    });
                  } else if (value is bool) {
                    formDataList.add({
                      "key": "field_$key",
                      "value": value ? "1" : "0",
                      "type": "text",
                    });
                  } else {
                    formDataList.add({
                      "key": "field_$key",
                      "value": value.toString(),
                      "type": "text",
                    });
                  }
                });

                // ✅ Prepare the correct structure
                final data = {
                  "user_id": userId,
                  "category_id": widget.categoryId.toString(),
                  "formdata": formDataList,
                };

                print("Final payload: ${jsonEncode(data)}");

                await attributeProvider.submitForm(data);
              }
            },


            icon: const Icon(FontAwesomeIcons.paperPlane, color: Colors.white),
            label: const Text(
              "Submit Ad",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
