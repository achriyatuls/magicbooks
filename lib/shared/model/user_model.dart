import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String? photoURL;
  final String nama;
  final String jurusan;
  final String kelas;
  final String absen;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoURL,
    required this.nama,
    required this.jurusan,
    required this.kelas,
    required this.absen,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'nama': nama,
      'jurusan': jurusan,
      'kelas': kelas,
      'absen': absen,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      photoURL: map['photoURL'],
      nama: map['nama'] ?? '',
      jurusan: map['jurusan'] ?? '',
      kelas: map['kelas'] ?? '',
      absen: map['absen'] ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  UserModel copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? photoURL,
    String? nama,
    String? jurusan,
    String? kelas,
    String? absen,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoURL: photoURL ?? this.photoURL,
      nama: nama ?? this.nama,
      jurusan: jurusan ?? this.jurusan,
      kelas: kelas ?? this.kelas,
      absen: absen ?? this.absen,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
