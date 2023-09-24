public class MathCheck {
    // Calculates the area if it is a square or the perimeter if it is a rectangle.
    // l - length of one side
    // w - length of another side
    // return - area or perimeter
    public static int AreaOrPerimeter(int l, int w) => l==w ? l*w : 2*(l+w);
}
