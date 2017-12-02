package Kek1;

public class Point {
    private double x;
    private double y;
    private double r;
    private double pageX;
    private double pageY;
    private boolean isInArea;
    Point(double x,double y, double r, double pageX, double pageY){
        this.x=x;
        this.y=y;
        this.r=r;
        this.pageX = pageX;
        this.pageY = pageY;
        isInArea = checkArea(x,y,r);

    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public double getpageX() {return pageX;}

    public double getpageY() {return pageY;}

    public boolean isInArea() {
        return isInArea;
    }

    public void setInArea(boolean inArea) {
        isInArea = inArea;
    }

    public void setR(int r) {
        this.r = r;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setpageX(double pageX) {
        this.pageX = pageX;
    }

    public void setpageY(double pageY) {
        this.pageY = pageY;
    }

    public static boolean checkArea(double x,double y,double R){
        if(x<=0&&y>=0&&y<=R&&x>=-R){
            return true;
        }
        if(x>=0&&y>=0&&y<=R-2*x){
            return true;
        }
        if(x<=0&&y<=0&&y*y+x*x<=R*R/4){
            return true;
        }
        return false;
    }
}