package Kek1;

public class Point {
    private double x;
    private double y;
    private double r;
    private double pageX;
    private double pageY;
    private boolean isInArea;
    private static boolean isCloudArea;
    Point(double x,double y, double r, double pageX, double pageY){
        this.x=x;
        this.y=y;
        this.r=r;
        this.pageX = pageX;
        this.pageY = pageY;
        isInArea = checkArea(x,y,r);
        isCloudArea = false;
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

    public static boolean checkCloudArea(double x,double y,double R){
        x = Math.abs(x);
        y = Math.abs(y);
        double a1 = R;
        double b1 = R/4;
        double a2 = 3*R/8;
        double b2 = R/4;
        double dx2 = a2;
        double dy2 = b2;
        double r = R/4;
        double dy3 = 3*R/8;
        //Верхняя часть - окружность
        if (Math.pow(x, 2) + Math.pow(y-dy3, 2) <= Math.pow(r, 2)){
            return true;
        }
        //Основная часть - эллипс
        else if (Math.pow(x, 2)/Math.pow(a1, 2) + Math.pow(y, 2)/Math.pow(b1, 2) <= 1){
            return true;
        }
        //Еще один эллипс
        else if (Math.pow(x-dx2, 2)/Math.pow(a2, 2) + Math.pow(y-dy2, 2)/Math.pow(b2, 2) <= 1){
            return true;
        }
        else return false;
    }

    public static void setCloudGraph(boolean condition){
        isCloudArea = condition;
    }
}