package entity.exercise2;

public class Student implements IStudent {
    private int studentID;
    private String studentName;
    private int group;

    public Student( ) {
    }

    public Student(int studentID, String studentName, int group) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.group = group;
    }


    @Override
    public void diemDanh() {
        System.out.println(this.studentName + " điểm danh");
    }

    @Override
    public void hocBai() {
        System.out.println(this.studentName + " đang học bài");
    }

    @Override
    public void donVS() {
        System.out.println(this.studentName + " đang học bài");
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getGroup() {
        return group;
    }

    public void setGroup(int group) {
        this.group = group;
    }
}
