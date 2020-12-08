package board;

import java.util.List;

public interface BoardService {
	//CRUD : Create Read Update Delete
	int board_insert(BoardVO vo);				//방명록 글쓰기 저장
	BoardPage board_list(BoardPage page);		//방명록 목록 조회
	BoardVO board_detail(int id);				//방명록 상세 조회
	int board_read(int id);						//방명록 조회수 증가 처리
	int board_update(BoardVO vo);				//방명록 글 변경 저장
	int board_delete(int id);					//방명록 글 삭제 처리
	
	int board_comment_regist(BoardCommentVO vo);	//댓글 저장 처리
	List<BoardVO> board_comment_list(int bid);		//댓글 목록 조회
	int board_comment_update(BoardCommentVO vo);	//댓글 변경
	int board_comment_delete(int id);				//댓글 삭제
}
