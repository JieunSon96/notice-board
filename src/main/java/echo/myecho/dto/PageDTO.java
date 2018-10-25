package echo.myecho.dto;

public class PageDTO {
	private int pageSize; // �� �������� ������ �Խñ� ��
	private int pageBlock; // ����¡ �׺� ������
	private int pageNo; // ������ ��ȣ
	private int startRowNo; // ��ȸ ���� row��ȣ
	private int endRowNo; // ��ȸ ������ row ��ȣ
	private int firstPageNo;// ù��° ������ ��ȣ
	private int finalPageNo; // ������ ������ ��ȣ
	private int prevPageNo; // ���� ������ ��ȣ
	private int nextPageNo; // ���� ������ ��ȣ
	private int startPageNo; // ���� ������(����¡ �׺� ����)
	private int endPageNo; // �� ������(����¡ �׺� ����)
	private int totalCount;// ��ü �Խñ� ��
	private String searchCondition; // �˻�����
	private String searchValue; // �˻���

	public PageDTO() {
	};

	public PageDTO(int pageSize, int pageBlock, int pageNo, int startRowNo, int endRowNo, int firstPageNo,
			int finalPageNo, int prevPageNo, int nextPageNo, int startPageNo, int endPageNo, int totalCount,
			String searchCondition, String searchValue) {
		super();
		this.pageSize = pageSize;
		this.pageBlock = pageBlock;
		this.pageNo = pageNo;
		this.startRowNo = startRowNo;
		this.endRowNo = endRowNo;
		this.firstPageNo = firstPageNo;
		this.finalPageNo = finalPageNo;
		this.prevPageNo = prevPageNo;
		this.nextPageNo = nextPageNo;
		this.startPageNo = startPageNo;
		this.endPageNo = endPageNo;
		this.totalCount = totalCount;
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getStartRowNo() {
		return startRowNo;
	}

	public void setStartRowNo(int startRowNo) {
		this.startRowNo = startRowNo;
	}

	public int getEndRowNo() {
		return endRowNo;
	}

	public void setEndRowNo(int endRowNo) {
		this.endRowNo = endRowNo;
	}

	public int getFirstPageNo() {
		return firstPageNo;
	}

	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	public int getFinalPageNo() {
		return finalPageNo;
	}

	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.makePaging();
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	private void makePaging() {
		 // �⺻ �� ����
        if (this.totalCount == 0) return; 
        if (this.pageNo == 0) this.setPageNo(1);   //�⺻ ������ ��ȣ
        if (this.pageSize == 0) this.setPageSize(20); //�⺻ ������ ����Ʈ ������
        if (this.pageBlock == 0 ) this.setPageBlock(5); //�⺻ ������ �׺�[���] ������
        
        //--[ù ������], [������ ������] ���
        int finalPage = (totalCount + (pageSize - 1)) / pageSize; // ������ ������
        this.setFirstPageNo(1);   // ù ��° ������ ��ȣ
        this.setFinalPageNo(finalPage); // ������ ������ ��ȣ
        
        //-- [����] , [����] ������ ���
        boolean isNowFirst = pageNo == 1 ? true : false;    // ���� ������ (��ü)
        boolean isNowFinal = pageNo == finalPage ? true : false;  // ������ ������ (��ü)
        if (isNowFirst) {
            this.setPrevPageNo(1); // ���� ������ ��ȣ
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // ���� ������ ��ȣ
        }
        if (isNowFinal) {
            this.setNextPageNo(finalPage); // ���� ������ ��ȣ
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // ���� ������ ��ȣ
        }
                
        //-- ����¡ �׺�[���]�� ���
        int startPage = ((pageNo - 1) / pageBlock) * pageBlock + 1; // ���� ������ (����¡ �׺� ����)
        int endPage = startPage + pageBlock - 1;      // �� ������ (����¡ �׺� ����)

        // ����¡ �׺� ���� [20-30] �ε� ������ �������� 28 �� ��� 
        // [29, 30] �������� ����¡ �׺� �̳��� �ؾ� �Ѵ�.
        if (endPage > finalPage) { // [������ ������ (����¡ �׺� ����) > ������ ������] ���� ū ��� 
            endPage = finalPage;  
        }
        this.setStartPageNo(startPage); // ���� ������ (����¡ �׺� ����)
        this.setEndPageNo(endPage);  // �� ������ (����¡ �׺� ����)



        //--��ȸ ���� row, ��ȸ ������ row ���
        int startRowNo = ( (pageNo-1) * pageSize ) + 1;
        int endRowNo = pageNo * pageSize; 
        setStartRowNo( startRowNo );
        setEndRowNo( endRowNo );
    }


	}


