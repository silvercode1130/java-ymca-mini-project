package com.example.db.vo;

public class FileVo {

	int file_idx; // (PK)
	int board_idx; //(FK)
	String file_original_name; // (유저가 올린 이름)
	String file_saved_name; // (서버에 저장된 실제 파일명, 중복 방지용)
	String file_path; // (경로)
	int file_size; //(용량)
	String file_type; // (MIME 타입 / 확장자)
	String file_regdate;

}
