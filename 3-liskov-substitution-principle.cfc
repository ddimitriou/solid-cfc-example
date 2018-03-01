// Liskov Substitution Principle Violation
// The Rectangle - Square problem
component bindingName="Rectangle"
{
    property name="width" setter=true getter=true;
    property name="height" setter=true getter=true;

    public numeric function area()
    {
         return height * width;
    }
}

component bindingName="Square" extends="Rectangle"
{
    public void function setHeight(value)
    {
        width = value;
        height = value;
    }

    public void function setWidth(value)
    {
        width = value;
        height = value;
    }
}

component bindingName="RectangleTest"
{
    property name="rectangle";

    public any function init(Rectangle rectangle)
    {
        rectangle = rectangle;
    }

    public any function testArea()
    {
        rectangle.setHeight(2);
        rectangle.setWidth(3);
        // Expect rectangle's area to be 6
    }
}
