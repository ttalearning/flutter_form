import 'package:flutter/material.dart';

List<Map<String, dynamic>> genders = [
  {"id": 0, "gender": "Nam"},
  {"id": 1, "gender": "Nữ"},
  {"id": 2, "gender": "Khác"},
];

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _formKey = GlobalKey<FormState>();
  String? name, email, password;
  int? selectGender, selectVaiTro = 0;
  bool? dieuKhoan = false, thongBao = false;
  var thongTin = {};
  onSumit() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    final gioiTinhText = () {
      switch (selectGender) {
        case 0:
          return 'Nam';
        case 1:
          return 'Nữ';
        case 2:
          return 'Khác';
        default:
          return null;
      }
    }();
    thongTin = {
      "hoTen": name,
      "email": email,
      "matKhau": password,
      "gioiTinh": gioiTinhText,
      "vaiTro": selectVaiTro == 0 ? "User" : "Admin",
      "dieuKhoan": dieuKhoan,
      "thongBao": thongBao,
    };

    setState(() {});
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Gửi form thành công!')));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full Form Example', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              TextFormField(
                initialValue: "",
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: "Họ tên",

                  prefixIcon: Icon(Icons.person, size: 23),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Vui lòng nhập tên';

                  if (value.length < 3) return 'Tên phải có ít nhất 3 ký tự';
                  return null;
                },
                onSaved: (value) => name = value,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: "",
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email, size: 23),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Vui lòng email';
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
                onSaved: (value) => email = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: "",
                obscureText: true,
                maxLength: 50,
                decoration: InputDecoration(
                  labelText: "Mật Khẩu",
                  prefixIcon: Icon(Icons.password, size: 23),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Vui lòng nhập mật khẩu';
                  if (value.length < 6 || value.length > 16)
                    return 'Mật khẩu phải từ 6-16 ký tự';
                },
                onSaved: (value) => password = value,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                decoration: InputDecoration(labelText: "Giới Tính"),
                items: genders.map((gender) {
                  return DropdownMenuItem(
                    value: gender['id'] as int,
                    child: Text(gender['gender']),
                  );
                }).toList(),
                validator: (value) =>
                    value == null ? 'Vui lòng chọn giới tính' : null,
                onChanged: (value) => selectGender = value,
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text('Đồng ý điều khoản sử dụng'),
                value: dieuKhoan ?? false,
                onChanged: (value) => setState(() {
                  dieuKhoan = value;
                }),
              ),
              SizedBox(height: 10),
              Text('Vai trò: '),
              RadioListTile(
                title: Text('User'),
                value: 0,
                groupValue: selectVaiTro ?? 0,
                onChanged: (value) => setState(() {
                  selectVaiTro = value;
                }),
              ),
              RadioListTile(
                title: Text('Admin'),
                value: 1,
                groupValue: selectVaiTro ?? 0,
                onChanged: (value) => setState(() {
                  selectVaiTro = value;
                }),
              ),
              SizedBox(height: 10),
              SwitchListTile(
                title: Text('Bật Thông Báo'),
                value: thongBao ?? false,
                onChanged: (value) => setState(() {
                  thongBao = value;
                }),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () => onSumit(),
                  child: Text('Gửi'),
                ),
              ),
              if (thongTin.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text('Kết quả: $thongTin'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
